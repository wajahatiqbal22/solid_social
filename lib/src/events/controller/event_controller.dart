import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:solid_social/config/config.dart';
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/shared/utility/utility_service.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap_controller.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/events/domain/entities/event/event.dart';
import 'package:solid_social/src/events/domain/services/event_service.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';

class EventController extends BootstrapController {
  EventController(super.services, {required this.selectedCommunity, bool isCreating = true}) {
    if (isCreating) {
      getGroups(selectedCommunity: selectedCommunity);
    }
    getEvents(selectedCommunity: selectedCommunity);
    initAgora();
  }

  final Community selectedCommunity;

  Future<void> getGroups({required Community selectedCommunity, Function(DBException)? onError}) async {
    try {
      state = Loading.processing;
      allGroups = await services.groupsService.getCommunityGroups(communityId: selectedCommunity.id!);
      state = Loading.loaded;
    } on DBException catch (e, stk) {
      onError?.call(e);
    }
  }

  List<DiscussionGroup> allGroups = List.empty(growable: true);
  List<DiscussionGroup> selectedGroups = List.empty(growable: true);
  List<Event> _allEvents = List.empty(growable: true);
  List<Event> get allEvents => _allEvents;
  set allEvents(List<Event> events) {
    _allEvents = [...events];
    notifyListeners();
  }

  // String represents event id and the list represents the members present inside the event
  Map<String, List<SolidSocialUser>> eventMembers = {};

  void toggleSelectedGroups({required DiscussionGroup group, required bool isChecked}) {
    if (isChecked) {
      selectedGroups.add(group);
    } else {
      selectedGroups.removeWhere((element) => element.id == group.id);
    }
    notifyListeners();
  }

  void clearSelectedGroups() {
    selectedGroups.clear();
    notifyListeners();
  }

  final EventService _eventService = IEventService();

  Loading _state = Loading.idle;
  Loading get state => _state;
  set state(Loading state) {
    _state = state;
    notifyListeners();
  }

  Loading _memberLoadingState = Loading.idle;
  Loading get memberLoadingState => _memberLoadingState;
  set memberLoadingState(Loading state) {
    _memberLoadingState = state;
    notifyListeners();
  }

  Future<void> getEvents({
    required Community selectedCommunity,
    Function(DBException)? onError,
    Function()? onSuccess,
  }) async {
    try {
      state = Loading.processing;
      allEvents = await _eventService.getEvents(communityId: selectedCommunity.id!);

      state = Loading.loaded;
      onSuccess?.call();
    } on DBException catch (e) {
      state = Loading.error;
      onError?.call(e);
    }
  }

  Future<void> getEventMembers(
    List<String> groupIds,
    String eventId, {
    Function(DBException)? onError,
    Function()? onSuccess,
  }) async {
    try {
      memberLoadingState = Loading.processing;
      eventMembers[eventId] = await _eventService.getMembers(groupIds: groupIds);

      memberLoadingState = Loading.loaded;
      onSuccess?.call();
    } on DBException catch (e) {
      memberLoadingState = Loading.error;
      onError?.call(e);
    }
  }

  Future<void> createEvent(
      {required String eventName,
      required bool isPrivate,
      required bool isRecording,
      required SolidSocialUser currentUser,
      required DateTime createdAt,
      required DateTime eventDateTime,
      Function(DBException)? onError,
      Function(Event)? onSuccess}) async {
    try {
      state = Loading.processing;
      final event = Event(
        communityId: selectedCommunity.id!,
        eventId: UtilityService.generateDocumentId(),
        eventName: eventName,
        isPrivate: isPrivate,
        isRecording: isRecording,
        groupIds: selectedGroups.map((e) => e.id).toList(),
        host: EventHost(
          hostId: currentUser.uid,
          hostName: "${currentUser.firstName} ${currentUser.lastName}",
          profilePic: currentUser.userDetails.profileUrl,
        ),
        createdAt: createdAt,
        eventDateTime: eventDateTime,
      );
      await _eventService.createEvent(event);
      allEvents = [...allEvents, event];
      state = Loading.loaded;
      onSuccess?.call(event);
    } on DBException catch (e, s) {
      state = Loading.error;
      onError?.call(e);
    }
  }

  // Agora Integrations
  late RtcEngine _rtcEngine;

  Future<void> initAgora() async {
    _rtcEngine = createAgoraRtcEngine();
    await _rtcEngine.initialize(
      const RtcEngineContext(
        appId: Config.agoraAppId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ),
    );

    // _rtcEngine.registerEventHandler(
    //   RtcEngineEventHandler(
    //     onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
    //       debugPrint("local user ${connection.localUid} joined");
    //     },
    //     onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
    //       debugPrint("remote user $remoteUid joined");
    //     },
    //     onUserOffline: (RtcConnection connection, int remoteUid,
    //         UserOfflineReasonType reason) {
    //       debugPrint("remote user $remoteUid left channel");
    //     },
    //     onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
    //       debugPrint(
    //           '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
    //     },
    //   ),
    // );
    // await _rtcEngine.enableVideo();
    // await _rtcEngine.startPreview();
  }

  Future<void> setRtcRole({required Event event}) async {
    await _rtcEngine.setClientRole(
      role: event.host.hostId == super.services.authService.currentUser!.uid
          ? ClientRoleType.clientRoleBroadcaster
          : ClientRoleType.clientRoleAudience,
    );
  }
}
