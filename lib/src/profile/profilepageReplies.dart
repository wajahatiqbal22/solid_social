// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:solid_social/utils/assets/emojis.dart';
import 'package:solid_social/utils/assets/posts.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class ProfilePageRepliesScreen extends StatelessWidget {
  const ProfilePageRepliesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ReplyItem(
          profilePicture: 'assets/sample_images/avatars/avatar2.png',
          username: 'JamesJ',
          repliedTo: "Stephen Paul",
          timeUpdated: '30min',
          caption: 'That is so funny 😂😂',
          commentCount: 5,
          onEmojiTapped: (emoji) {},
          emojiItems: const [
            EmojiButton(
              reactionCount: 5,
              emojiIcon: InterText(
                text: "😂",
                fontSize: 20,
              ),
            ),
          ],
          repliedToProfilePicture: "assets/sample_images/avatars/avatar4.png",
          repliedCaption:
              "Did you hear about the cow that got lost in the mountains? The steaks have never been higher.",
        ),
        ReplyItem(
          onEmojiTapped: (emoji) {},
          profilePicture: 'assets/sample_images/avatars/avatar2.png',
          username: 'JamesJ',
          repliedTo: "Almadendj",
          timeUpdated: '45min',
          caption: 'Welcome Man! 🔥🔥',
          commentCount: 5,
          emojiItems: [
            EmojiButton(
              reactionCount: 5,
              emojiIcon: CustomEmoji.fire(),
            ),
          ],
          repliedToProfilePicture: "assets/sample_images/avatars/avatar7.png",
          repliedCaption: "Thank you James J!",
        ),
      ],
    );
  }
}
