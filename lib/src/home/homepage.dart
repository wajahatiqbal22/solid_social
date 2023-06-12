// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/shared/drawer.dart';
import 'package:solid_social/shared/topAppBar.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:solid_social/src/community/screens/discussion_groups/my_discussion_groups.dart';
import 'package:solid_social/src/community/screens/no_communities.dart';
import 'package:solid_social/src/home/controllers/home_controller.dart';
import 'package:solid_social/src/home/tabs/courses/courses_screen.dart';
import 'package:solid_social/src/home/tabs/shope/shopScreen.dart';
import 'package:solid_social/src/home/tabs/timeline/timeline.dart';
import 'package:solid_social/src/profile/personalProfile/personalProfilePage.dart';
import 'package:solid_social/src/search/search.dart';
import 'package:solid_social/utils/assets/menus.dart';

import '../../shared/bottomNavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  /// global key for scaffold that has the timeline drawer
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// method to open the drawer in timeline
  static openMainDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(context.read<Bootstrap>()),
      child: Builder(builder: (context) {
        context.read<AuthController>().stateNotifier = (state) {
          state.maybeWhen(
              orElse: () {},
              logOut: () {
                context.offAll(AppRouter.splash);
              });
        };
        final controller = context.read<HomeController>();
        context.select((HomeController con) => con.state);
        context.select((HomeController con) => con.selectedCommunity);
        final community = controller.selectedCommunity;
        if (community == null && controller.state == Loading.loaded) {
          return const NoCommunities();
        } else if (controller.state == Loading.processing) {
          return const Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
        }
        return DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Scaffold(
            drawerEnableOpenDragGesture: false,
            key: HomePage._scaffoldKey,
            drawer: const MainDrawer(),
            backgroundColor: Colors.white,
            body: screenOptions(context.read<HomeController>()).elementAt(_selectedBottomNavBarItemIndex),
            bottomNavigationBar: MainBottomNavBar(onPressed: (int index) {
              _bottomNavigationRouter(index, context.read<HomeController>());
            }),
          ),
        );
      }),
    );
  }

  List<Widget> screenOptions(HomeController controller) {
    return [
      // timeline screen
      _mainScreen(controller),

      // search screen
      const SearchScreen(),

      // my discussion groups screen
      MyDiscussionGroupsScreen(controller: controller.groupsController),

      // personal profile page screen
      const PersonalProfilePageScreen(),
    ];
  }

  /// Screen Options for main screen, corresponds with BottomNavBar index

  /// this is the index for bottom navigation bar items (Left to Right)
  int _selectedBottomNavBarItemIndex = 0;

  _bottomNavigationRouter(int navigationRouterItem, HomeController controller) async {
    // if home icon is pressed
    if (navigationRouterItem == BottomNavBarScreens.home.value) {
      // show home screen
      setState(() {
        _selectedBottomNavBarItemIndex = BottomNavBarScreens.home.value;
        // set current index for bottom navbar
        MainBottomNavBar.currentNavBarIndex = BottomNavBarScreens.home.value;
      });
      return;
    }

    if (navigationRouterItem == BottomNavBarScreens.search.value) {
      // show search screen
      setState(() {
        _selectedBottomNavBarItemIndex = BottomNavBarScreens.search.value;
        // set current index for bottom navbar
        MainBottomNavBar.currentNavBarIndex = BottomNavBarScreens.search.value;
      });
      return;
    }

    // if popupMenu icon is pressed
    if (navigationRouterItem == BottomNavBarScreens.popupMenu.value) {
      // instantiate bottomNavBarMenu object to access showMainMenu method
      MenuMainBottomNavBar bottomNavBarMenu = MenuMainBottomNavBar(
        context: context,
        controller: controller,
      );
      // popup the menu
      bottomNavBarMenu.showMainMenu();

      // change current index for bottom navbar
      setState(() {
        MainBottomNavBar.currentNavBarIndex = BottomNavBarScreens.popupMenu.value;
      });
      return;
    }

    // if discussion groups icon is pressed
    if (navigationRouterItem == BottomNavBarScreens.discussionGroups.value) {
      /// this offset is for popupMenu (doesn't have index in screenOptions[])
      int offset = 1;
      // show discussion groups screen
      setState(() {
        _selectedBottomNavBarItemIndex = BottomNavBarScreens.discussionGroups.value - offset;
        // set current index for bottom navbar
        MainBottomNavBar.currentNavBarIndex = BottomNavBarScreens.discussionGroups.value;
      });
      return;
    }

    // if profile icon is pressed
    if (navigationRouterItem == BottomNavBarScreens.profile.value) {
      /// this offset is for popupMenu (doesn't have index in screenOptions[])
      int offset = 1;
      // show profile screen
      setState(() {
        _selectedBottomNavBarItemIndex = BottomNavBarScreens.profile.value - offset;
        // set current index for bottom navbar
        MainBottomNavBar.currentNavBarIndex = BottomNavBarScreens.profile.value;
      });
      return;
    }
  }

  /// main screen or timeline
  Scaffold _mainScreen(HomeController controller) {
    return Scaffold(
      appBar: MainAppBar(selectedCommunity: controller.selectedCommunity!),
      body: TabBarView(
        children: [
          TimelineScreen(
            controller: controller,
            selectedCommunity: controller.selectedCommunity!,
          ),
          const CoursesScreen(),
          const ShopScreen(),
        ],
      ),
    );
  }
}

enum BottomNavBarScreens {
  home,
  search,
  popupMenu,
  discussionGroups,
  profile,
}

extension BottomNavBarScreensExtension on BottomNavBarScreens {
  int get value {
    // home is first index in bottom navigation bar
    if (this == BottomNavBarScreens.home) return 0;

    // search is second index in bottom navigation bar
    if (this == BottomNavBarScreens.search) return 1;

    // popupMenu is third index in bottom navigation bar
    if (this == BottomNavBarScreens.popupMenu) return 2;

    // discussionGroups is fourth index in bottom navigation bar
    if (this == BottomNavBarScreens.discussionGroups) return 3;

    // profile is fifth index in bottom navigation bar
    if (this == BottomNavBarScreens.profile) return 4;

    // default return value
    return 0;
  }
}
