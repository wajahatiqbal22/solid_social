// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class DiscoverDiscussionGroupsScreen extends StatelessWidget {
  const DiscoverDiscussionGroupsScreen({Key? key}) : super(key: key);

  final double _cardHeight = 80;
  final double _cardWidth = 150;
  final double _horizontalAxisSpacing = 25;
  final double _profilePictureSize = 36;
  final double _verticalAxisSpacing = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchAppBarField(),
        leading: const CustomBackButton(),
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
      ),
      body: _listBody(context),
    );
  }

  Widget _listBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _titleSection("Discover Discussion Groups"),
          Expanded(
            child: Center(
              child: GridView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline / 2),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                // itemBuilder: (context, index) {
                //   return _card(
                //     asset: "assets/sample_images/image1.png",
                //     title: "Fashion Events",
                //     avatarAsset: "assets/sample_images/avatars/avatar2.png",
                //     onPressed: () {},
                //   );
                // },
                children: [
                  Center(
                    child: _card(
                      asset: "assets/sample_images/image1.png",
                      title: "Fashion Events",
                      avatarAsset: "assets/sample_images/avatars/avatar2.png",
                      onPressed: () {},
                    ),
                  ),
                  Center(
                    child: _card(
                      asset: "assets/sample_images/image1.png",
                      title: "Fashion Events",
                      avatarAsset: "assets/sample_images/avatars/avatar2.png",
                      onPressed: () {},
                    ),
                  ),
                  Center(
                    child: _card(
                      asset: "assets/sample_images/image1.png",
                      title: "Fashion Events",
                      avatarAsset: "assets/sample_images/avatars/avatar2.png",
                      onPressed: () {},
                    ),
                  ),
                  Center(
                    child: _card(
                      asset: "assets/sample_images/image1.png",
                      title: "Fashion Events",
                      avatarAsset: "assets/sample_images/avatars/avatar2.png",
                      onPressed: () {},
                    ),
                  ),
                  Center(
                    child: _card(
                      asset: "assets/sample_images/womens-fashion.png",
                      title: "Women's Fashion",
                      avatarAsset: "assets/sample_images/avatars/avatar11.png",
                      onPressed: () {},
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: _verticalAxisSpacing),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       _card(
                  //         asset: "assets/sample_images/image1.png",
                  //         title: "Fashion Events",
                  //         avatarAsset: "assets/sample_images/avatars/avatar2.png",
                  //         onPressed: () {},
                  //       ),
                  //       SizedBox(
                  //         width: _horizontalAxisSpacing,
                  //       ),
                  //       _card(
                  //         asset: "assets/sample_images/avatars/avatar6.jpg",
                  //         title: "Men's Fashion",
                  //         avatarAsset: "assets/sample_images/avatars/avatar2.png",
                  //         onPressed: () {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: _verticalAxisSpacing),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       _card(
                  //         asset: "assets/sample_images/womens-fashion.png",
                  //         title: "Women's Fashion",
                  //         avatarAsset: "assets/sample_images/avatars/avatar11.png",
                  //         onPressed: () {},
                  //       ),
                  //       SizedBox(
                  //         width: _horizontalAxisSpacing,
                  //       ),
                  //       _card(
                  //         title: "Men's Fashion",
                  //         onPressed: () {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: _verticalAxisSpacing),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       _card(
                  //         title: "Women's Fashion",
                  //         onPressed: () {},
                  //       ),
                  //       SizedBox(
                  //         width: _horizontalAxisSpacing,
                  //       ),
                  //       _card(
                  //         asset: "assets/sample_images/vintage.png",
                  //         title: "Vintages",
                  //         onPressed: () {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: _verticalAxisSpacing),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       _card(
                  //         title: "Video Games",
                  //         onPressed: () {},
                  //       ),
                  //       SizedBox(
                  //         width: _horizontalAxisSpacing + _cardWidth,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card({String? asset, required String title, required Function() onPressed, String? avatarAsset}) {
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
                          asset,
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

  Widget _titleSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: CustomGlobal.paddingTop, bottom: CustomGlobal.paddingTop / 2),
      child: HeadingText3(
        text: title,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _searchAppBarField() {
    return InputField(
      placeholder: "Search for Discussion group",
      prefixIcon: CustomIcons.search(color: CustomColors.grey75, width: 16),
      contentPadding: 8,
      paddingRight: 15,
      enableBorder: false,
      placeholderSize: 10,
      isDense: true,
    );
  }
}
