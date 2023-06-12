// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/community/screens/create_community/inviteCommunityMembers.dart';
import 'package:solid_social/src/home/controllers/home_controller.dart';
import 'package:solid_social/utils/assets/popups.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../../shared/bottomNavBar.dart';
import 'icons.dart';

class MenuMainBottomNavBar {
  final BuildContext context;
  final HomeController controller;

  // constructor
  MenuMainBottomNavBar({
    required this.context,
    required this.controller,
  });

  /// Pops up the main menu; Default animation direction is Top to Bottom
  showMainMenu() async {
    return await showMenu<MenuItems>(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), side: const BorderSide(style: BorderStyle.none)),
      context: context,
      position: RelativeRect.fromDirectional(
          textDirection: TextDirection.ltr,
          start: 1,
          top: MediaQuery.of(context).size.height - 65 - 285,
          end: 0,
          bottom: 65),
      items: menuItemsList,
    ).then<void>((MenuItems? selected) {
      // dont do anything if nothing is selected
      if (selected == null) return;

      // if createPost popup is selected
      if (selected == MenuItems.createPost) {
        // create instance object of PopupCreatePost
        if (controller.timelineController != null) {
          PopupCreatePost createPostObj = PopupCreatePost(context: context, controller: controller.timelineController!);
          createPostObj.popUp();
        }

        // call popUp method to popup menu

        return;
      }

      // if createEvent screen is selected
      if (selected == MenuItems.createEvent) {
        // go to createEvent screen
        context.toNamed(AppRouter.createEvent, arguments: controller.selectedCommunity);
        // Navigator.pushNamed(context, '/events/createEvent');
        return;
      }

      // if inviteMember screen is selected
      if (selected == MenuItems.inviteMember) {
        // go to inviteCommunityMembers screen
        if (controller.selectedCommunity != null) {
          context.toNamed(
            AppRouter.inviteCommunityMembers,
            arguments: InviteCommunityMembersArgs(
              community: controller.selectedCommunity!,
              isCreating: false,
            ),
          );
        }
        return;
      }

      // if createDiscussionGroup screen is selected
      if (selected == MenuItems.createDiscussionGroup) {
        if (controller.groupsController != null) {
          // go to createDiscussionGroup screen
          context.toNamed(AppRouter.create, arguments: controller.groupsController);
        }
      }
    });
  }
}

List<PopupMenuEntry<MenuItems>> menuItemsList = [
  PopupMenuItem(
    value: MenuItems.createPost,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CustomIcons.firstLine,
        ),
        const InterText(
          text: "Create a Post",
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ],
    ),
  ),
  const PopupMenuDivider(
    height: 0.5,
  ),
  PopupMenuItem(
    value: MenuItems.createStory,
    child: SizedBox(
      width: 185.0,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomIcons.createStory,
          ),
          const InterText(
            text: "Create a Story",
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ],
      ),
    ),
  ),
  const PopupMenuDivider(
    height: 0.5,
  ),
  PopupMenuItem(
    value: MenuItems.createEvent,
    child: SizedBox(
      width: 185.0,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomIcons.calendar,
          ),
          const InterText(
            text: "Create an Event",
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ],
      ),
    ),
  ),
  const PopupMenuDivider(
    height: 0.5,
  ),
  PopupMenuItem(
    value: MenuItems.createDiscussionGroup,
    padding: const EdgeInsets.only(left: 16, right: 0),
    child: SizedBox(
      width: 185.0,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomIcons.personTwo2(),
          ),
          const Expanded(
            child: InterText(
              text: "Create a Discussion Group",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  ),
  const PopupMenuDivider(
    height: 0.5,
  ),
  PopupMenuItem(
    value: MenuItems.inviteMember,
    padding: const EdgeInsets.only(left: 16, right: 0),
    child: SizedBox(
      width: 185.0,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomIcons.profileAdd,
          ),
          const Expanded(
            child: InterText(
              text: "Invite a Member",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  ),
];
