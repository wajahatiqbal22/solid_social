// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/lists.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class JoinCommunityListScreen extends StatelessWidget {
  const JoinCommunityListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText5(
          text: "Join Community",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: CustomGlobal.paddingTop,
            left: CustomGlobal.paddingInline,
            right: CustomGlobal.paddingInline,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomListItem(
                  title: "Fashion Trend",
                  subtitle: "All about fashion everyday of our lives ❤️❤️",
                  imageUrl: "assets/sampleImage2.png",
                  enableButton: true,
                  onButtonPressed: () {
                    Navigator.pushNamed(context, '/community/successJoinedCommunity');
                  },
                ),
                CustomListItem(
                  title: "Sweet Boys",
                  subtitle: "Sweet boys association Nigeria Ltd. SBA to the world! ",
                  imageUrl: "assets/sample_images/avatars/sweet-boys.png",
                  enableButton: true,
                  onButtonPressed: () {
                    Navigator.pushNamed(context, '/community/successJoinedCommunity');
                  },
                ),
                CustomListItem(
                  title: "Model Coms",
                  subtitle: "Everything about sport. soccer, basketball etc.️",
                  imageUrl: "assets/sample_images/avatars/model-coms.png",
                  enableButton: true,
                  onButtonPressed: () {
                    Navigator.pushNamed(context, '/community/successJoinedCommunity');
                  },
                ),
                CustomListItem(
                  title: "Fashion",
                  subtitle: "Everything you need to know about crypto currencies",
                  imageUrl: "assets/sample_images/avatars/fashion.png",
                  enableButton: true,
                  onButtonPressed: () {
                    Navigator.pushNamed(context, '/community/successJoinedCommunity');
                  },
                ),
                CustomListItem(
                  title: "Fashion Lovers",
                  subtitle: "Relationship Dos and dont’s",
                  imageUrl: "assets/sample_images/avatars/fashion-lovers.png",
                  enableButton: true,
                  onButtonPressed: () {
                    Navigator.pushNamed(context, '/community/successJoinedCommunity');
                  },
                ),
                CustomListItem(
                  title: "Gaming",
                  subtitle: "Talks on video games.️",
                  imageUrl: "assets/sample_images/avatars/gaming.png",
                  enableButton: true,
                  onButtonPressed: () {
                    Navigator.pushNamed(context, '/community/successJoinedCommunity');
                  },
                ),
                CustomListItem(
                  title: "Music Lovers",
                  subtitle: "New musics release and talks about popular music artists️",
                  imageUrl: "assets/sample_images/avatars/music-lovers.png",
                  enableButton: true,
                  onButtonPressed: () {
                    Navigator.pushNamed(context, '/community/successJoinedCommunity');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
