import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/home/domain/controller/timeline_controller.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/posts.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:timeago/timeago.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key, required this.args}) : super(key: key);

  final CommentsScreenArgs args;

  @override
  Widget build(BuildContext context) {
    return StreamChannel(
      channel: args.channel,
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: HeadingText5(
            text: "Comments ${args.parentMessage.replyCount}",
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamMessageListView(
                dateDividerBuilder: (_) => const SizedBox(),
                headerBuilder: (_) => const SizedBox(),
                threadSeparatorBuilder: (_, pm) => const SizedBox(),
                parentMessageBuilder: (_, __, ___) => const SizedBox(),
                reverse: false,
                parentMessage: args.parentMessage,
                messageFilter: (m) {
                  return !m.isDeleted;
                },
                messageBuilder: (c, d, msgs, child) {
                  // return child;
                  final localEmojis = context.read<Bootstrap>().emojisMap;

                  final scores = d.message.reactionScores;
                  final reactionButtons = scores?.entries
                          .map((e) => EmojiButton(
                              reactionCount: e.value,
                              emojiIcon: Text(localEmojis[e.key].toString(), style: const TextStyle(fontSize: 22))))
                          .toList() ??
                      [];
                  return CommentsItem(
                      onEmojiTapped: (emoji) async {
                        await args.controller.addReaction(d.message, emoji);
                      },
                      profilePicture: d.message.user?.image,
                      username: d.message.user?.name ?? "",
                      timeUpdated: format(d.message.createdAt),
                      caption: d.message.text,
                      emojiItems: reactionButtons
                      // replyCount: 50,
                      );
                },
              ),
            ),
            Builder(builder: (context) {
              // print(StreamMessageInput());
              return StreamMessageInput(
                preMessageSending: (message) {
                  message = message.copyWith(parentId: args.parentMessage.id, showInChannel: false);
                  return message;
                },
                showCommandsButton: false,
                // messageInputController: StreamMessageInputController(),
              );
            })
          ],
        ),
      ),
    );
  }
}

class CommentsScreenArgs {
  final Channel channel;
  final Message parentMessage;
  final TimelineController controller;

  CommentsScreenArgs({required this.channel, required this.controller, required this.parentMessage});
}

// children: [
//   CommentsItem(
//     onEmojiTapped: (emoji) {},
//     profilePicture: "assets/sample_images/avatars/avatar3.png",
//     username: "Grace Barlow",
//     timeUpdated: "30mins",
//     caption:
//         "I just made my donation. Can't wait for this event to be successful already",
//     emojiItems: [
//       EmojiButton(
//         reactionCount: 8,
//         emojiIcon: CustomEmoji.fire(),
//       ),
//     ],
//     replyCount: 50,
//   ),
//   CommentsItem(
//     onEmojiTapped: (emoji) {},
//     profilePicture: "assets/sample_images/avatars/avatar3.png",
//     username: "Grace Barlow",
//     timeUpdated: "30mins",
//     caption:
//         "I just made my donation. Can't wait for this event to be successful already",
//     emojiItems: [
//       EmojiButton(
//         reactionCount: 8,
//         emojiIcon: CustomEmoji.fire(),
//       ),
//     ],
//     replyCount: 50,
//   ),
//   CommentsItem(
//     onEmojiTapped: (emoji) {},
//     profilePicture: "assets/sample_images/avatars/avatar3.png",
//     username: "Grace Barlow",
//     timeUpdated: "30mins",
//     caption:
//         "I just made my donation. Can't wait for this event to be successful already",
//     emojiItems: [
//       EmojiButton(
//         reactionCount: 8,
//         emojiIcon: CustomEmoji.fire(),
//       ),
//     ],
//     replyCount: 50,
//   ),
//   CommentsItem(
//     onEmojiTapped: (emoji) {},
//     profilePicture: "assets/sample_images/avatars/avatar3.png",
//     username: "Grace Barlow",
//     timeUpdated: "30mins",
//     caption:
//         "I just made my donation. Can't wait for this event to be successful already",
//     emojiItems: [
//       EmojiButton(
//         reactionCount: 8,
//         emojiIcon: CustomEmoji.fire(),
//       ),
//     ],
//     replyCount: 50,
//   ),
//   CommentsItem(
//     onEmojiTapped: (emoji) {},
//     profilePicture: "assets/sample_images/avatars/avatar3.png",
//     username: "Grace Barlow",
//     timeUpdated: "30mins",
//     caption:
//         "I just made my donation. Can't wait for this event to be successful already",
//     emojiItems: [
//       EmojiButton(
//         reactionCount: 8,
//         emojiIcon: CustomEmoji.fire(),
//       ),
//     ],
//   ),
//   CommentsItem(
//     onEmojiTapped: (emoji) {},
//     profilePicture: "assets/sample_images/avatars/avatar3.png",
//     username: "Grace Barlow",
//     timeUpdated: "30mins",
//     caption:
//         "I just made my donation. Can't wait for this event to be successful already",
//     emojiItems: [
//       EmojiButton(
//         reactionCount: 8,
//         emojiIcon: CustomEmoji.fire(),
//       ),
//     ],
//   ),
// ],
