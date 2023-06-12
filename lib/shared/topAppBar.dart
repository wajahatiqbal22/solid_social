// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
// Project imports:
import 'package:solid_social/src/home/homepage.dart';
import 'package:solid_social/utils/assets/colors.dart';

import '../utils/assets/textstyles.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({Key? key, required this.selectedCommunity}) : super(key: key);
  final Community selectedCommunity;

  @override
  Size get preferredSize => const Size.fromHeight(100);

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
              color: Colors.black,
              width: 24,
            ),
          ),
        ),
      ],
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () => HomePage.openMainDrawer(),
            icon: SvgPicture.asset('assets/custom_icons/menu.svg'),
          );
        },
      ),
      title: HeadingText3(
        text: selectedCommunity.communityName,
      ),
      backgroundColor: Colors.white,
      elevation: 0.5,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      bottom: TabBar(
        labelStyle: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.headline5,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        labelColor: CustomColors.blue,
        unselectedLabelColor: CustomColors.grey75,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
        tabs: const <Widget>[
          Tab(
            text: "Timeline",
          ),
          Tab(
            text: "Courses",
          ),
          Tab(
            text: "Shop",
          ),
        ],
      ),
    );
  }
}
