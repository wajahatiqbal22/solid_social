// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:solid_social/src/profile/profilePageAppBar.dart';
import 'package:solid_social/src/profile/profilepageGroups.dart';
import 'package:solid_social/src/profile/profilepageReplies.dart';
import 'package:solid_social/utils/assets/emojis.dart';
import 'package:solid_social/utils/assets/posts.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("REBUILT");
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: const ProfileAppBar(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: TabBarView(
            children: [
              Center(
                child: ListView(
                  children: [
                    PostItem(
                      profilePicture: 'assets/sample_images/avatars/avatar2.png',
                      username: 'JamesJ',
                      timeUpdated: '30min',
                      caption:
                          'Hello everyone on the community, I’m so happy to be here with y’all. I’m James, a Fashion Designer...',
                      attachments: const ["assets/sample_images/image1.png"],
                      onEmojiTapped: (emoji) {},
                    ),
                    PostItem(
                      profilePicture: 'assets/sample_images/avatars/avatar2.png',
                      username: 'JamesJ',
                      timeUpdated: '45min',
                      caption:
                          'Motivating and enriching lives around me with life chnging quotes and inspiring seminars to build a better community for all',
                      emojiItems: [
                        EmojiButton(
                          reactionCount: 2,
                          emojiIcon: CustomEmoji.heart(),
                        ),
                        EmojiButton(reactionCount: 2, emojiIcon: CustomEmoji.handWave()),
                        EmojiButton(reactionCount: 5, emojiIcon: CustomEmoji.huggingFace()),
                      ],
                      commentCount: 16,
                      onEmojiTapped: (emoji) {},
                    ),
                    PostItem(
                      profilePicture: 'assets/sample_images/avatars/avatar2.png',
                      username: 'JamesJ',
                      timeUpdated: '45min',
                      caption:
                          'Hi Guys, I’m super stocked to announce that I just became the latest Gucci Brand Ambassador',
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
                      onEmojiTapped: (emoji) {},
                    ),
                  ],
                ),
              ),

              // replies tab
              const ProfilePageRepliesScreen(),

              const ProfilePageGroupsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
