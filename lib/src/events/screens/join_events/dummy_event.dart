import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solid_social/config/config.dart';

/// MultiChannel Example
class JoinChannelVideo extends StatefulWidget {
  /// Construct the [JoinChannelVideo]
  const JoinChannelVideo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<JoinChannelVideo> {
  late final RtcEngine _engine;
  bool _isReadyPreview = false;

  bool isJoined = false, switchCamera = true, switchRender = true;
  Set<int> remoteUid = {};
  late TextEditingController _controller;
  bool _isUseFlutterTexture = false;
  bool _isUseAndroidSurfaceView = false;
  ChannelProfileType _channelProfileType = ChannelProfileType.channelProfileLiveBroadcasting;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "hello");

    _initEngine();
  }

  @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  Future<void> _initEngine() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(appId: Config.agoraAppId));

    _engine.registerEventHandler(RtcEngineEventHandler(
      onError: (ErrorCodeType err, String msg) {
        log('[onError] err: $err, msg: $msg');
      },
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        log('[onJoinChannelSuccess] connection: ${connection.toJson()} elapsed: $elapsed');
        setState(() {
          isJoined = true;
        });
      },
      onUserJoined: (RtcConnection connection, int rUid, int elapsed) {
        log('[onUserJoined] connection: ${connection.toJson()} remoteUid: $rUid elapsed: $elapsed');
        setState(() {
          remoteUid.add(rUid);
        });
      },
      onUserOffline: (RtcConnection connection, int rUid, UserOfflineReasonType reason) {
        log('[onUserOffline] connection: ${connection.toJson()}  rUid: $rUid reason: $reason');
        setState(() {
          remoteUid.removeWhere((element) => element == rUid);
        });
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats) {
        log('[onLeaveChannel] connection: ${connection.toJson()} stats: ${stats.toJson()}');
        setState(() {
          isJoined = false;
          remoteUid.clear();
        });
      },
    ));

    await _engine.enableVideo();

    await _engine.setVideoEncoderConfiguration(
      const VideoEncoderConfiguration(
        dimensions: VideoDimensions(width: 640, height: 360),
        frameRate: 15,
        bitrate: 0,
      ),
    );

    await _engine.startPreview();

    setState(() {
      _isReadyPreview = true;
    });
  }

  Future<void> _joinChannel() async {
    await _engine.joinChannel(
      token: Config.tempRtcToken,
      channelId: _controller.text,
      uid: 0,
      options: ChannelMediaOptions(
        channelProfile: _channelProfileType,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
  }

  Future<void> _leaveChannel() async {
    await _engine.leaveChannel();
  }

  Future<void> _switchCamera() async {
    await _engine.switchCamera();
    setState(() {
      switchCamera = !switchCamera;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExampleActionsWidget(
        displayContentBuilder: (context, isLayoutHorizontal) {
          if (!_isReadyPreview) return Container();
          return Stack(
            children: [
              AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: _engine,
                  canvas: const VideoCanvas(uid: 0),
                  useFlutterTexture: _isUseFlutterTexture,
                  useAndroidSurfaceView: _isUseAndroidSurfaceView,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.of(remoteUid.map(
                      (e) => SizedBox(
                        width: 120,
                        height: 120,
                        child: AgoraVideoView(
                          controller: VideoViewController.remote(
                            rtcEngine: _engine,
                            canvas: VideoCanvas(uid: e),
                            connection: RtcConnection(channelId: _controller.text),
                            useFlutterTexture: _isUseFlutterTexture,
                            useAndroidSurfaceView: _isUseAndroidSurfaceView,
                          ),
                        ),
                      ),
                    )),
                  ),
                ),
              )
            ],
          );
        },
        actionsBuilder: (context, isLayoutHorizontal) {
          final channelProfileType = [
            ChannelProfileType.channelProfileLiveBroadcasting,
            ChannelProfileType.channelProfileCommunication,
          ];
          final items = channelProfileType
              .map((e) => DropdownMenuItem(
                    child: Text(
                      e.toString().split('.')[1],
                    ),
                    value: e,
                  ))
              .toList();

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'Channel ID'),
              ),
              if (!kIsWeb &&
                  (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS))
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (defaultTargetPlatform == TargetPlatform.iOS)
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Rendered by Flutter texture: '),
                            Switch(
                              value: _isUseFlutterTexture,
                              onChanged: isJoined
                                  ? null
                                  : (changed) {
                                      setState(() {
                                        _isUseFlutterTexture = changed;
                                      });
                                    },
                            )
                          ]),
                    if (defaultTargetPlatform == TargetPlatform.android)
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Rendered by Android SurfaceView: '),
                            Material(
                              child: Switch(
                                value: _isUseAndroidSurfaceView,
                                onChanged: isJoined
                                    ? null
                                    : (changed) {
                                        setState(() {
                                          _isUseAndroidSurfaceView = changed;
                                        });
                                      },
                              ),
                            ),
                          ]),
                  ],
                ),
              const SizedBox(
                height: 20,
              ),
              const Text('Channel Profile: '),
              DropdownButton<ChannelProfileType>(
                items: items,
                value: _channelProfileType,
                onChanged: isJoined
                    ? null
                    : (v) {
                        setState(() {
                          _channelProfileType = v!;
                        });
                      },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: isJoined ? _leaveChannel : _joinChannel,
                      child: Text('${isJoined ? 'Leave' : 'Join'} channel'),
                    ),
                  )
                ],
              ),
              if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) ...[
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _switchCamera,
                  child: Text('Camera ${switchCamera ? 'front' : 'rear'}'),
                ),
              ],
            ],
          );
        },
      ),
    );
    // if (!_isInit) return Container();
  }
}

typedef ExampleActionsBuilder = Widget Function(BuildContext context, bool isLayoutHorizontal);

class ExampleActionsWidget extends StatelessWidget {
  const ExampleActionsWidget({
    Key? key,
    required this.displayContentBuilder,
    this.actionsBuilder,
  }) : super(key: key);

  final ExampleActionsBuilder displayContentBuilder;

  final ExampleActionsBuilder? actionsBuilder;

  @override
  Widget build(BuildContext context) {
    final mediaData = MediaQuery.of(context);
    final bool isLayoutHorizontal = mediaData.size.aspectRatio >= 1.5 ||
        (kIsWeb || !(defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS));

    if (actionsBuilder == null) {
      return displayContentBuilder(context, isLayoutHorizontal);
    }

    const actionsTitle = Text(
      'Actions',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );

    if (isLayoutHorizontal) {
      return Material(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      actionsTitle,
                      actionsBuilder!(context, isLayoutHorizontal),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey.shade100,
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: displayContentBuilder(context, isLayoutHorizontal),
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        SizedBox.expand(
          child: Container(
            padding: const EdgeInsets.only(bottom: 150),
            child: displayContentBuilder(context, isLayoutHorizontal),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.25,
          snap: true,
          maxChildSize: 0.7,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 253, 253, 253),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.grey,
                    ),
                  ]),
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    actionsTitle,
                    actionsBuilder!(context, isLayoutHorizontal),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
