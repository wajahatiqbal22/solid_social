// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:intl/intl.dart';
// Project imports:
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ChatArgs args;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    _initializeChat();
    super.initState();
  }

  _initializeChat() async {
    final state = await widget.args.channel.watch();

    setState(() {
      isChannelInitialized = true;
    });
  }

  bool isChannelInitialized = false;

  @override
  Widget build(BuildContext context) {
    return !isChannelInitialized
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          )
        : Builder(builder: (context) {
            final extraData = Map<String, dynamic>.from(widget.args.channel.extraData["groupData"] as Map);

            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: _titleSection(
                    context: context,
                    avatarAsset: extraData["displayPhotoUrl"] as String?,
                    memberCount: widget.args.channel.memberCount ?? 0,
                    title: widget.args.group?.groupName ?? extraData["groupName"] ?? ""),
                actions: _actionsSection(),
                centerTitle: false,
                leading: const CustomBackButton(),
              ),
              body: StreamChannel(
                channel: widget.args.channel,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: StreamMessageListView(
                          // onMessageTap: (d) {},
                          emptyBuilder: (context) {
                            return _contentNoChats();
                          },
                          messageBuilder: (context, details, messages, StreamMessageWidget child) {
                            return child.copyWith(
                                messageTheme: child.messageTheme.copyWith(
                                  messageBackgroundColor: details.isMyMessage ? CustomColors.blue : CustomColors.blue50,
                                ),
                                textBuilder: (context, message) {
                                  return InterText(
                                    text: message.text ?? "",
                                    fontSize: 15,
                                    color: details.isMyMessage ? Colors.white : Colors.black,
                                  );
                                },
                                userAvatarBuilder: (context, user) {
                                  return CircularNameInitials(name: user.name, radius: 15);
                                });
                          },
                        ),
                      ),
                    ),
                    const StreamMessageInput(),
                  ],
                ),
              ),
              // bottomSheet: _bottomSection(),
            );
          });
  }

  Widget _sentChatItem({
    required String profilePictureAsset,
    required String time,
    required String name,
    required String message,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InterText(text: "$name "),
                  InterText(text: time, color: CustomColors.grey75),
                ],
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 230,
                ),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(color: CustomColors.blue, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10),
                child: InterText(
                  text: message,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          ProfilePictureImage(asset: profilePictureAsset, width: 30),
        ],
      ),
    );
  }

  Widget _receivedChatItem({
    required String profilePictureAsset,
    required String time,
    required String name,
    required String message,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfilePictureImage(asset: profilePictureAsset, width: 30),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InterText(text: "$name "),
                  InterText(
                    text: time,
                    color: CustomColors.grey75,
                  ),
                ],
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 230,
                ),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(color: CustomColors.blue50, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10),
                child: InterText(
                  text: message,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _contentNoChats() {
    const double columnSpacing = 8;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: InterText(text: "You Created Group", color: CustomColors.grey75),
        ),
        const SizedBox(height: columnSpacing),
        Center(
          child: HeadingText3(text: widget.args.group?.groupName ?? ""),
        ),
        const SizedBox(height: columnSpacing),
        _dateDivider(date: DateFormat.MMMd().format(widget.args.channel.createdAt!)),
      ],
    );
  }

  Widget _dateDivider({required String date, EdgeInsets margin = EdgeInsets.zero}) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(
            BorderSide(color: CustomColors.grey25Black, width: 0.5),
          ),
          borderRadius: BorderRadius.circular(300.0),
        ),
        margin: margin,
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 8,
        ),
        child: InterText(
          text: date,
          color: CustomColors.grey75,
        ),
      ),
    );
  }

  Widget _bottomSection() {
    return Container(
      constraints: const BoxConstraints(minHeight: 60),
      height: 0,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: CustomColors.grey25Black, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: InputField(
                placeholder: "Message",
                fillColor: CustomColors.grey25,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CustomIcons.camera2(),
          ),
          IconButton(
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.only(right: 10),
              onPressed: () {},
              icon: CustomIcons.microphone()),
        ],
      ),
    );
  }

  Widget _titleSection({
    required BuildContext context,
    required String title,
    required String? avatarAsset,
    required int memberCount,
  }) {
    return Ink(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRouter.chatSettings);
        },
        child: Row(
          children: [
            ProfilePictureImage(
              asset: avatarAsset,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText5(text: title),
                const SizedBox(height: 3),
                InterText(
                  text: "$memberCount Members",
                  color: CustomColors.grey75,
                  fontSize: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _actionsSection() {
    return [
      IconButton(
        onPressed: () {},
        icon: CustomIcons.call(),
      ),
      IconButton(
        onPressed: () {},
        icon: CustomIcons.video(),
      )
    ];
  }
}

class ChatArgs {
  final DiscussionGroup? group;
  final Channel channel;

  ChatArgs({required this.channel, this.group});
}
