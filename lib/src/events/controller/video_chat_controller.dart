import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:solid_social/config/config.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/events/domain/entities/event/event.dart';
import 'package:solid_social/src/events/domain/entities/live_user/live_user.dart';
import 'package:solid_social/src/events/domain/repo/live_stream_repo.dart';

const String testChannelName = "testtest123";
const String rtcTokenKey = "rtcToken";

class VideoChatController extends ChangeNotifier {
  VideoChatController({required this.currentEvent, required this.currentUser}) {
    _initialize();
  }

  final Event currentEvent;
  final SolidSocialUser currentUser;
  final LiveSessionRepo _repo = ILiveSessionRepo();

  StreamSubscription<List<LiveUser>>? _liveSession;

  Future<void> _initialize() async {
    // setupVideoSDKEngine();
    enableAgoraClient();
  }

  RtcEngine? engine;

  late AgoraClient _agoraClient;
  AgoraClient get client => _agoraClient;

  bool _isEngineReady = false;
  bool get isEngineReady => _isEngineReady;

  bool _isPermissionGranted = false;
  bool get isPermissionGranted => _isPermissionGranted;

  Future<void> requestNecessaryPermissions() async {
    final status = await [Permission.microphone, Permission.camera].request();
    _isPermissionGranted =
        !status.containsValue(PermissionStatus.denied) || !status.containsValue(PermissionStatus.permanentlyDenied);

    notifyListeners();
  }

  Future<void> enableAgoraClient() async {
    final userId = DateTime.now().microsecondsSinceEpoch;
    await requestNecessaryPermissions();
    _agoraClient = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          username: jsonEncode(currentUser.toJson()),
          appId: Config.agoraAppId,
          channelName: currentEvent.eventId,
          tokenUrl: "https://agora-token-service-production-7e14.up.railway.app",
          uid: userId),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
      agoraEventHandlers: AgoraRtcEventHandlers(
        onJoinChannelSuccess: (connection, elapsed) {},
        onUserJoined: (connection, remoteUid, elapsed) async {},
        onError: (err, msg) {},
      ),
      agoraChannelData: AgoraChannelData(
        channelProfileType: ChannelProfileType.channelProfileLiveBroadcasting,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );

    try {
      await _agoraClient.initialize();
      await _agoraClient.engine.enableAudioVolumeIndication(interval: 200, smooth: 7, reportVad: true);
      _isPermissionGranted = true;
      _isEngineReady = true;
      streamLiveUsers();
      notifyListeners();
    } catch (e) {
      log("Error joining the video chat: $e");
    } finally {
      notifyListeners();
    }
  }

  List<LiveUser> _liveUsers = [];
  List<LiveUser> get liveUsers => _liveUsers;
  set liveUsers(List<LiveUser> users) {
    _liveUsers = [...users];
  }

  Future<void> streamLiveUsers() async {
    await _repo.updateLiveUsers(
        currentEvent.eventId, LiveUser.fromSolidSocialUser(currentUser, currentEvent.host.hostId == currentUser.uid));
    _liveSession = _repo.streamLiveUsers(currentEvent.eventId).listen((event) {
      liveUsers = event;
    }, cancelOnError: true);
  }

  Future<void> toggleMute({required SessionController sessionController}) async {
    var status = await Permission.microphone.status;
    if (sessionController.value.isLocalUserMuted && status.isDenied) {
      await Permission.microphone.request();
    }
    sessionController.value =
        sessionController.value.copyWith(isLocalUserMuted: !(sessionController.value.isLocalUserMuted));
    await sessionController.value.engine?.muteLocalAudioStream(sessionController.value.isLocalUserMuted);
  }

  /// Function to toggle enable/disable the camera
  Future<void> toggleCamera({required SessionController sessionController}) async {
    var status = await Permission.camera.status;
    if (sessionController.value.isLocalVideoDisabled && status.isDenied) {
      await Permission.camera.request();
    }
    sessionController.value =
        sessionController.value.copyWith(isLocalVideoDisabled: !(sessionController.value.isLocalVideoDisabled));
    await sessionController.value.engine?.muteLocalVideoStream(sessionController.value.isLocalVideoDisabled);
  }

  /// Function to switch between front and rear camera
  Future<void> switchCamera({required SessionController sessionController}) async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();
    }

    await sessionController.value.engine?.switchCamera();
  }

  bool isCallEnded = false;

  /// Function to dispose the RTC and RTM engine.
  Future<void> endCall({required SessionController sessionController}) async {
    await sessionController.value.engine?.leaveChannel();
    if (sessionController.value.connectionData!.rtmEnabled) {
      await sessionController.value.agoraRtmChannel?.leave();
      await sessionController.value.agoraRtmClient?.logout();
    }
    await sessionController.value.engine?.stopPreview();
    await sessionController.value.engine?.release();
    isCallEnded = true;
  }

  @override
  void dispose() {
    _disposeRtcEngine();
    _liveSession?.cancel();
    super.dispose();
  }

  Future<void> _disposeRtcEngine() async {
    await engine?.leaveChannel();
    await _repo.leaveSession(currentEvent.eventId, currentUser.uid);
    await engine?.release();

    if (!isCallEnded) {
      await client.engine.leaveChannel();
      await client.engine.release();
    }
  }
}
