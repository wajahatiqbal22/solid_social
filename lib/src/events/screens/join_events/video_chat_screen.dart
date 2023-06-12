// Flutter imports:
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:solid_social/src/events/controller/event_controller.dart';
import 'package:solid_social/src/events/controller/video_chat_controller.dart';
import 'package:solid_social/src/events/domain/entities/event/event.dart';
import 'package:solid_social/src/events/screens/widgets/retry_permission.dart';
// Project imports:
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class VideoChatScreen extends StatefulWidget {
  const VideoChatScreen({required this.args, Key? key}) : super(key: key);

  final VideoChatScreenArgs args;

  @override
  State<VideoChatScreen> createState() => _VideoChatScreenState();
}

class _VideoChatScreenState extends State<VideoChatScreen> {
  final canvasUid = DateTime.now().millisecondsSinceEpoch;

  late PersistentBottomSheetController _sheetController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  bool isMicMuted = false;
  bool isCameraOff = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VideoChatController(
        currentEvent: widget.args.event,
        currentUser: context.read<AuthController>().solidSocialUser,
      ),
      child: Builder(builder: (context) {
        final controller = context.read<VideoChatController>();
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: HeadingText5(
              text: widget.args.event.eventName,
            ),
            centerTitle: true,
          ),
          body: Builder(builder: (context) {
            final hasPermissions = context.select((VideoChatController value) => value.isPermissionGranted);
            return hasPermissions
                ? Stack(
                    children: [
                      Builder(builder: (context) {
                        final isEngineReady = context.select((VideoChatController value) => value.isEngineReady);
                        return isEngineReady
                            ? Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: AgoraVideoViewer(
                                          floatingLayoutMainViewPadding: const EdgeInsets.all(8),
                                          floatingLayoutSubViewPadding: const EdgeInsets.all(8),
                                          enableHostControls: true,
                                          layoutType: Layout.floating,
                                          showAVState: true,
                                          client: controller.client,
                                          showNumberOfUsers: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.width * 0.8,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.switchCamera(
                                                  sessionController: controller.client.sessionController);
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: const BoxDecoration(
                                                color: Color.fromARGB(255, 189, 200, 209),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.switch_camera_outlined,
                                                color: Colors.black,
                                                size: 35,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.toggleMute(
                                                  sessionController: controller.client.sessionController);
                                              setState(() {
                                                isMicMuted = !isMicMuted;
                                              });
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                color:
                                                    isMicMuted ? Colors.red : const Color.fromARGB(255, 189, 200, 209),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  "assets/custom_icons/video_mute.svg",
                                                  height: 35,
                                                  width: 35,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.toggleCamera(
                                                  sessionController: controller.client.sessionController);
                                              setState(() {
                                                isCameraOff = !isCameraOff;
                                              });
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                color:
                                                    isCameraOff ? Colors.red : const Color.fromARGB(255, 189, 200, 209),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  "assets/custom_icons/video_camera.svg",
                                                  height: 35,
                                                  width: 35,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.endCall(
                                                  sessionController: controller.client.sessionController);
                                              context.pop();
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: const BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  "assets/custom_icons/video_endcall.svg",
                                                  height: 35,
                                                  width: 35,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : const Center(child: CircularProgressIndicator.adaptive());
                      }),
                      // DraggableScrollableSheet(
                      //   snap: true,
                      //   initialChildSize: 0.2,
                      //   minChildSize: 0.15,
                      //   builder: (BuildContext context, ScrollController scrollController) {
                      //     return SingleChildScrollView(
                      //       controller: scrollController,
                      //       child: Column(
                      //         children: [
                      //           Text('Hello'),
                      //           Text('Hello'),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  )
                : RetryPermission(onRetry: controller.requestNecessaryPermissions);
          }),
        );
      }),
    );
  }

  Future<void> showModalBottomSheet() async {
    _sheetController = _scaffoldKey.currentState!.showBottomSheet(
      (context) => DraggableScrollableSheet(
        builder: (context, scrollController) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("hello world"),
                Text("hello world"),
                Text("hello world"),
                Text("hello world"),
                Text("hello world"),
                Text("hello world"),
                Text("hello world"),
                Text("hello world"),
                Text("hello world"),
                Text("hello world"),
                Text("hello world"),
              ],
            ),
          );
        },
      ),
      enableDrag: true,
    );
  }
}

class VideoChatScreenArgs {
  final EventController eventController;
  final Event event;
  VideoChatScreenArgs({required this.eventController, required this.event});
}
