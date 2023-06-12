// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/cards.dart';

class ProfilePageGroupsScreen extends StatelessWidget {
  const ProfilePageGroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: GridView(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline / 2),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  children: [
                    Center(
                      child: DiscussionGroupsCard(
                        asset: "assets/sample_images/image1.png",
                        title: "Fashion Events",
                        avatarAsset: "assets/sample_images/avatars/avatar2.png",
                        onPressed: () {},
                      ),
                    ),
                    Center(
                      child: DiscussionGroupsCard(
                        asset: "assets/sample_images/image1.png",
                        title: "Fashion Events",
                        avatarAsset: "assets/sample_images/avatars/avatar2.png",
                        onPressed: () {},
                      ),
                    ),
                    Center(
                      child: DiscussionGroupsCard(
                        asset: "assets/sample_images/image1.png",
                        title: "Fashion Events",
                        avatarAsset: "assets/sample_images/avatars/avatar2.png",
                        onPressed: () {},
                      ),
                    ),
                    Center(
                      child: DiscussionGroupsCard(
                        asset: "assets/sample_images/image1.png",
                        title: "Fashion Events",
                        avatarAsset: "assets/sample_images/avatars/avatar2.png",
                        onPressed: () {},
                      ),
                    ),
                    Center(
                      child: DiscussionGroupsCard(
                        asset: "assets/sample_images/womens-fashion.png",
                        title: "Women's Fashion",
                        avatarAsset: "assets/sample_images/avatars/avatar11.png",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
