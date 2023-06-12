// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:solid_social/utils/assets/icons.dart';
import '../utils/assets/colors.dart';

class MainBottomNavBar extends StatefulWidget {
  final Function(int) onPressed;

  const MainBottomNavBar({
    super.key,
    required this.onPressed,
  });

  static int currentNavBarIndex = 0;

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  final double _iconSize = 24;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: CustomColors.grey25Black, width: 1),
        ),
      ),
      constraints: const BoxConstraints(minHeight: 65),
      child: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        backgroundColor: Colors.white,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: MainBottomNavBar.currentNavBarIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/custom_icons/bottom_nav/outlined/home.svg",
              width: _iconSize,
            ),
            label: "",
            activeIcon: CustomIcons.homeBold(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/custom_icons/bottom_nav/outlined/search.svg",
              width: _iconSize,
            ),
            label: "",
            activeIcon: CustomIcons.searchBold(),
          ),
          BottomNavigationBarItem(icon: CustomIcons.addBottomBar, label: ""),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/custom_icons/bottom_nav/outlined/2person.svg",
              width: _iconSize,
            ),
            label: "",
            activeIcon: CustomIcons.personTwoBold(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/custom_icons/bottom_nav/outlined/person.svg",
              width: _iconSize,
            ),
            label: "",
            activeIcon: CustomIcons.personBold(),
          ),
        ],
        onTap: widget.onPressed,
      ),
    );
  }
}

enum MenuItems {
  createPost,
  createStory,
  createEvent,
  createDiscussionGroup,
  inviteMember,
}
