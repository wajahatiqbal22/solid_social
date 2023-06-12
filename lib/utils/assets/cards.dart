// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:solid_social/utils/assets/textstyles.dart';

import '../GLOBAL.dart';
import 'buttons.dart';
import 'colors.dart';
import 'icons.dart';
import 'images.dart';

class CommunityCard extends StatelessWidget {
  final double _paddingInline = 20;
  final double _paddingVertical = 35;

  final String iconAsset;
  final String title;
  final String subtitle;
  final void Function() onPressed;
  const CommunityCard({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: _paddingVertical, horizontal: _paddingInline),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.00),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              offset: Offset(4, 4),
              spreadRadius: 1,
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(iconAsset),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingText2(
                    text: title,
                  ),
                  HeaderSubText(
                    text: subtitle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventsCard extends StatelessWidget {
  final String title;
  final String subText;
  final String hostPictureAsset;
  final String hostName;
  final int peopleCount;
  final dynamic subIcon;
  final String peopleAltText;
  final Color backgroundColor;
  final String? backgroundOverlayImageAsset;
  final String mainButtonText;
  final Function() mainButtonOnPressed;

  const EventsCard({
    super.key,
    required this.title,
    required this.subText,
    required this.hostName,
    required this.hostPictureAsset,
    required this.peopleCount,
    required this.subIcon,
    required this.mainButtonText,
    required this.mainButtonOnPressed,
    this.peopleAltText = "going",
    this.backgroundColor = const Color(0xFF1B4965),
    this.backgroundOverlayImageAsset,
  });

  final double _contentVerticalSpacing = 10;
  final double _contentHorizontalSpacing = 10;
  final double _containerPadding = 16;

  @override
  Widget build(BuildContext context) {
    bool shouldImage = false;
    if (backgroundOverlayImageAsset != null) {
      shouldImage = true;
    }
    return Container(
      margin: const EdgeInsets.only(top: CustomGlobal.paddingTop),
      height: 235,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        image: shouldImage
            ? DecorationImage(
                image: AssetImage(backgroundOverlayImageAsset!),
                fit: BoxFit.fill,
              )
            : null,
      ),
      child: Column(
        children: [
          // TITLE ROW
          Padding(
            padding: EdgeInsets.only(left: _containerPadding, right: _containerPadding, top: _containerPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: HeadingText3(
                      text: title,
                      textColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child:
                          IconButton(onPressed: () {}, icon: CustomIcons.postOptions(color: Colors.white, width: 23)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _contentVerticalSpacing,
          ),
          // DATE ROW
          Padding(
            padding: EdgeInsets.only(left: _containerPadding, right: _containerPadding),
            child: Row(
              children: [
                subIcon,
                const SizedBox(
                  width: 10,
                ),
                InterText(
                  text: subText,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: _contentVerticalSpacing,
          ),
          // HOST DETAILS ROW
          Padding(
            padding: EdgeInsets.only(left: _containerPadding, right: _containerPadding),
            child: Row(
              children: [
                ProfilePictureImage(
                  asset: hostPictureAsset,
                  width: 24,
                ),
                SizedBox(
                  width: _contentHorizontalSpacing,
                ),
                const InterText(
                  text: "Host",
                  color: Colors.white,
                ),
                SizedBox(
                  width: _contentHorizontalSpacing,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0x1A000000),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: InterText(
                    text: hostName,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomIcons.personTwo2(
                        color: Colors.white,
                        width: 24,
                      ),
                      SizedBox(
                        width: _contentHorizontalSpacing / 2,
                      ),
                      InterText(
                        text: "$peopleCount $peopleAltText",
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          const Divider(
            height: 30,
            thickness: 0.5,
            color: CustomColors.grey25,
          ),

          Padding(
            padding: EdgeInsets.only(left: _containerPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: MainBtn(
                    text: mainButtonText,
                    onPressed: mainButtonOnPressed,
                    textColor: CustomColors.blue,
                  ),
                ),
                ConstrainedBox(constraints: const BoxConstraints(maxWidth: 12, minWidth: 5)),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      height: 50,
                      width: 50,
                      child: CustomIcons.share2(width: 24),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DiscussionGroupsCard extends StatelessWidget {
  final String? asset;
  final String title;
  final Function() onPressed;
  final String? avatarAsset;
  const DiscussionGroupsCard({super.key, this.asset, required this.title, required this.onPressed, this.avatarAsset});

  final double _cardHeight = 80;
  final double _cardWidth = 150;
  final double _profilePictureSize = 36;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _cardHeight + _profilePictureSize / 2,
            child: Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  child: Stack(
                    children: [
                      // use this container when image doesn't exist
                      if (asset == null)
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF8E9AAF),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: _cardHeight,
                          width: _cardWidth,
                        ),

                      if (asset != null)
                        Image.asset(
                          asset!,
                          fit: BoxFit.cover,
                          height: _cardHeight,
                          width: _cardWidth,
                        ),
                    ],
                  ),
                ),
                Positioned(
                  top: _cardHeight - _profilePictureSize + 12,
                  left: 5,
                  child: ProfilePictureImage2(
                    imageAsset: avatarAsset ?? "assets/sample_images/avatars/bold-people.png",
                    size: _profilePictureSize,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: const Offset(0, 2),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
          HeadingText5(
            text: title,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String instructor;
  final double price;
  final Function() onPressed;

  const CourseCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.instructor,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            semanticContainer: true,
            elevation: 0,
            child: Image.asset(
              imageAsset,
              fit: BoxFit.cover,
              height: 120,
              width: 190,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InterText(
            text: title,
            fontSize: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const InterText(
                text: "Instructor ",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF707070),
              ),
              InterText(
                text: instructor,
              ),
            ],
          ),
          HeadingText5(
            text: "\$${price.toStringAsFixed(2)}",
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

class ShopCategoryCard extends StatelessWidget {
  final String title;
  final String asset;

  const ShopCategoryCard({
    super.key,
    required this.title,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Card(
            elevation: 0,
            child: ProfilePictureImage(
              width: 100,
              height: 100,
              asset: asset,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InterText(
            text: title,
          ),
        ],
      ),
    );
  }
}

class FundraiserCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final double progress;
  final String raised;
  final String goal;
  final Function() onPressed;

  const FundraiserCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.progress,
    required this.raised,
    required this.goal,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: const EdgeInsets.only(left: CustomGlobal.paddingInline),
          width: 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 110,
                width: 230,
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              InterText(
                text: title,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              const SizedBox(
                height: 10,
              ),
              LinearProgressIndicator(
                value: progress,
                color: CustomColors.blue,
                backgroundColor: CustomColors.grey25Black,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  InterText(
                    text: "\$$raised Raised",
                    color: CustomColors.blue,
                  ),
                  InterText(
                    text: " of \$$goal",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
