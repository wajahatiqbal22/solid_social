// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/src/profile/profilePageAppBar.dart';
import 'package:solid_social/utils/assets/emojis.dart';
import 'package:solid_social/utils/assets/posts.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../../auth/controllers/auth_controller.dart';

class PersonalProfilePageScreen extends StatelessWidget {
  const PersonalProfilePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Builder(builder: (context) {
        final currentUser = context.select((AuthController controller) => controller.solidSocialUser);
        return Scaffold(
          appBar: PersonalProfileAppBar(user: currentUser),
          backgroundColor: Colors.white,
          body: TabBarView(
            children: [
              _posts(context),
              _replies(),
            ],
          ),
        );
      }),
    );
  }

  Widget _posts(BuildContext context) {
    return Center(
      child: ListView(
        controller: ScrollController()
          ..addListener(() {
            FocusScope.of(context).unfocus();
          }),
        children: [
          PostItem(
            profilePicture: 'assets/sample_images/avatars/avatar2.png',
            username: 'JamesJ',
            timeUpdated: '30min',
            onEmojiTapped: (emoji) {},
            caption:
                'Hello everyone on the community, I’m so happy to be here with y’all. I’m James, a Fashion Designer...',
            attachments: const [
              "https://media.istockphoto.com/id/1145618475/photo/villefranche-on-sea-in-evening.jpg?s=612x612&w=0&k=20&c=vQGj6uK7UUVt0vQhZc9yhRO_oYBEf8IeeDxGyJKbLKI="
            ],
          ),
          PostItem(
            onEmojiTapped: (emoji) {},
            profilePicture: 'assets/sample_images/avatars/avatar2.png',
            username: 'JamesJ',
            timeUpdated: '45min',
            caption:
                'Motivating and enriching lives around me with life changing quotes and inspiring seminars to build a better community for all',
            emojiItems: [
              EmojiButton(
                reactionCount: 2,
                emojiIcon: CustomEmoji.heart(),
              ),
              EmojiButton(reactionCount: 2, emojiIcon: CustomEmoji.handWave()),
              EmojiButton(reactionCount: 5, emojiIcon: CustomEmoji.huggingFace()),
            ],
            commentCount: 16,
          ),
          PostItem(
            onEmojiTapped: (emoji) {},
            profilePicture: 'assets/sample_images/avatars/avatar2.png',
            username: 'JamesJ',
            timeUpdated: '45min',
            caption: 'Hi Guys, I’m super stocked to announce that I just became the latest Gucci Brand Ambassador',
            emojiItems: [
              EmojiButton(
                reactionCount: 200,
                emojiIcon: CustomEmoji.fire(),
                active: true,
              ),
              EmojiButton(
                reactionCount: 120,
                emojiIcon: CustomEmoji.partyHat(),
              ),
            ],
            commentCount: 16,
          ),
        ],
      ),
    );
  }

  Widget _replies() {
    return ListView(
      children: [
        ReplyItem(
          onEmojiTapped: (emoji) {},
          profilePicture: 'assets/sample_images/avatars/avatar2.png',
          username: 'JamesJ',
          repliedTo: "Stephen Paul",
          timeUpdated: '30min',
          caption: 'That is so funny 😂😂',
          commentCount: 5,
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
