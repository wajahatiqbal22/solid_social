// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
// Project imports:
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';

import '../../utils/assets/images.dart';
import '../../utils/assets/textstyles.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(320);

  final double profileOffset = 135;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 5,
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/custom_icons/notification.svg',
              color: Colors.white,
              width: 24,
            ),
          ),
        ),
      ],
      flexibleSpace: SizedBox(
        width: double.infinity,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.asset(
              'assets/sample_images/image1.png',
              fit: BoxFit.fitWidth,
              height: profileOffset,
            ),
            Padding(
              padding: EdgeInsets.only(top: profileOffset),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 45),
                    child: HeadingText2(text: "James J"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: InterText(text: 'Cool and easy going, here to mingle and make friends'),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ImageStack(
                        imageAsset1: "assets/sample_images/avatars/avatar2.png",
                        imageAsset2: "assets/sample_images/avatars/avatar3.png",
                        imageAsset3: "assets/sample_images/avatars/avatar4.png",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      HeadingText5(
                        text: "100",
                        fontSize: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      HeaderSubText(text: "Following"),
                      SizedBox(
                        width: 15,
                      ),
                      ImageStack(
                        imageAsset1: "assets/sample_images/avatars/avatar5.png",
                        imageAsset2: "assets/sample_images/avatars/avatar7.png",
                        imageAsset3: "assets/sample_images/avatars/avatar8.png",
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: HeadingText5(
                          text: "2520",
                          fontSize: 14,
                        ),
                      ),
                      HeaderSubText(text: "Followers"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: CustomGlobal.paddingInline,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(backgroundColor: CustomColors.blue),
                            child: const InterText(
                              text: "Follow",
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: CustomOutlinedButton(
                            onPressed: () {},
                            text: "Message",
                            verticalPadding: 10,
                            borderRadius: 6,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 36,
                          height: 36,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(300.0),
                              border: const Border.fromBorderSide(BorderSide(
                                color: CustomColors.grey25Black,
                                width: 0.5,
                              ))),
                          child: IconButton(
                            onPressed: () {},
                            icon: CustomIcons.call(color: CustomColors.blue, width: 20),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: profileOffset - 50),
              child: ProfilePictureImage(
                asset: 'assets/sample_images/avatars/avatar2.png',
                width: 80,
                enableLink: false,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(300.00),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.5,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      bottom: TabBar(
        labelStyle: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.headline5,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        labelColor: CustomColors.blue,
        unselectedLabelColor: CustomColors.grey75,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 25),
        tabs: const <Widget>[
          Tab(
            text: "Posts",
          ),
          Tab(
            text: "Replies",
          ),
          Tab(
            text: "Groups",
          ),
        ],
      ),
    );
  }
}

class PersonalProfileAppBar extends StatefulWidget with PreferredSizeWidget {
  const PersonalProfileAppBar({Key? key, required this.user}) : super(key: key);

  final SolidSocialUser user;

  @override
  State<PersonalProfileAppBar> createState() => _PersonalProfileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(300);
}

class _PersonalProfileAppBarState extends State<PersonalProfileAppBar> {
  final double profileOffset = 145;

  final double backgroundImageHeight = 135;

  final double profilePictureSize = 65;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
          padding: const EdgeInsets.only(
            right: 5,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.grey100,
                  borderRadius: BorderRadius.circular(300.0),
                ),
                width: 35,
                height: 35,
              ),
              IconButton(
                onPressed: () {},
                icon: CustomIcons.search(
                  color: Colors.white,
                ),
              )
            ],
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 5,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.grey100,
                  borderRadius: BorderRadius.circular(300.0),
                ),
                width: 35,
                height: 35,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.accountSettings);
                },
                icon: CustomIcons.settings(),
              )
            ],
          ),
        ),
      ],
      flexibleSpace: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.topLeft,
              clipBehavior: Clip.antiAlias,
              children: [
                Image.network(
                  widget.user.userDetails.bannerUrl ?? "",
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: backgroundImageHeight,
                      width: double.infinity,
                      color: Colors.grey,
                    );
                  },
                  fit: BoxFit.fitWidth,
                  height: backgroundImageHeight,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: backgroundImageHeight - profilePictureSize / 2, left: CustomGlobal.paddingInline),
                  child: ProfilePictureImage(
                    asset: widget.user.userDetails.profileUrl,
                    fit: BoxFit.cover,
                    height: profilePictureSize,
                    width: profilePictureSize,
                    decoration: BoxDecoration(
                      border: const Border.fromBorderSide(
                        BorderSide(width: 3, color: Colors.white),
                      ),
                      borderRadius: BorderRadius.circular(300.0),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: backgroundImageHeight, right: CustomGlobal.paddingInline),
                    child: CustomOutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.editProfile);
                      },
                      text: "Edit Profile",
                      horizontalPadding: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
            child: HeadingText3(
              text: "${widget.user.firstName} ${widget.user.lastName}",
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
            child: InterText(text: widget.user.userDetails.bio ?? ""),
          ),
          Padding(
            padding: const EdgeInsets.only(left: CustomGlobal.paddingInline, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                ImageStack(
                  imageAsset1: "assets/sample_images/avatars/avatar2.png",
                  imageAsset2: "assets/sample_images/avatars/avatar3.png",
                  imageAsset3: "assets/sample_images/avatars/avatar4.png",
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  child: HeadingText5(
                    text: "100",
                    fontSize: 14,
                  ),
                ),
                HeaderSubText(text: "Following"),
                SizedBox(
                  width: 15,
                ),
                ImageStack(
                  imageAsset1: "assets/sample_images/avatars/avatar5.png",
                  imageAsset2: "assets/sample_images/avatars/avatar7.png",
                  imageAsset3: "assets/sample_images/avatars/avatar8.png",
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: HeadingText5(
                    text: "2520",
                    fontSize: 14,
                  ),
                ),
                HeaderSubText(text: "Followers"),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0.5,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      bottom: TabBar(
        labelStyle: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.headline5,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        labelColor: CustomColors.blue,
        unselectedLabelColor: CustomColors.grey75,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 25),
        tabs: const <Widget>[
          Tab(
            text: "Posts",
          ),
          Tab(
            text: "Replies",
          ),
        ],
      ),
    );
  }
}
