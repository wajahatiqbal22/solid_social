import 'package:flutter/material.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../routes.dart';

class MyDiscussionGroupsScreen extends StatelessWidget {
  const MyDiscussionGroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const HeadingText5(
          text: "My Discussion Groups",
          fontWeight: FontWeight.w700,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, SampleAppRouter.discoverDiscussionGroups);
            },
            icon: CustomIcons.plus()
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: CustomGlobal.paddingTop / 2,
          ),
          _discussionGroupItem(
            imageAsset: "assets/sample_images/avatars/fashion-trend2.png",
            title: "Fashion Events",
            excerpt: "Grace Barlow: Hello Everyone 🤗",
            notificationNumber: 1,
            onPressed: (){
              Navigator.pushNamed(context, SampleAppRouter.chatScreenWithChats);
            }
          ),
          _divider(),
          _discussionGroupItem(
            imageAsset: "assets/sample_images/avatars/mens-fashion2.png",
            title: "Men's Fashion",
            excerpt: "Tasboy: I love the new Gucci Pant asdfajflj al;asjdf alsdjf s",
            notificationNumber: 10,
            onPressed: (){
              Navigator.pushNamed(context, SampleAppRouter.chatScreenWithChats);
            }
          ),
          _divider(),
          _discussionGroupItem(
            imageAsset: "assets/sample_images/avatars/gaming.png",
            title: "Stephen Paul",
            excerpt: "Stephen Paul: Hi everyone ☺️",
            onPressed: () {
              Navigator.pushNamed(context, SampleAppRouter.chatScreenWithChats);
            }
          ),
          _divider(),
        ],
      )
    );
  }

  Widget _divider() {
    return const Divider(
      color: CustomColors.grey25Black,
      height: 25,
      thickness: 0.5,
    );
  }

  Widget _discussionGroupItem({
    required final String imageAsset,
    required final String title,
    required final String excerpt,
    required Function() onPressed,
    final int notificationNumber = 0,
  }) {
    return Ink(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(
            left: CustomGlobal.paddingInline / 2,
            right: CustomGlobal.paddingInline / 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfilePictureImage2(
                        imageAsset: imageAsset,
                        size: 49
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: title,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InterText(
                              text: excerpt,
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if(notificationNumber > 0)
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                constraints: const BoxConstraints(
                  minHeight: 32,
                  minWidth: 43,
                ),
                child: Center(
                  child: InterText(
                    text: notificationNumber > 9 ? "9+" : "$notificationNumber",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

