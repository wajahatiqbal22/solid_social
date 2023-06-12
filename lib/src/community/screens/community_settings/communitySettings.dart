// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/settingButtons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class CommunitySettings extends StatelessWidget {
  const CommunitySettings({Key? key}) : super(key: key);

  static const double boxHeight = 55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText3(
          text: "Community Settings",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _headingSettingsListItem(text: "CUSTOMIZE YOUR COMMUNITY"),
            ButtonSettingsListButton(
              text: "Color and Fonts Style",
              onPressed: () {
                Navigator.pushNamed(context, '/community/settings/colorAndFontsStyle');
              },
            ),
            ButtonSettingsListButton(
              text: "Edit community name and logo",
              onPressed: () {
                Navigator.pushNamed(context, '/community/settings/editCommunityNameLogo');
              },
            ),
            _headingSettingsListItem(text: "COMMUNITY GUIDELINES AND PERMISSION"),
            ButtonSettingsListButton(
              text: "Set community guidelines",
              onPressed: () {
                Navigator.pushNamed(context, '/community/settings/setCommunityGuidelines');
              },
            ),
            ButtonSettingsListButton(
              text: "Edit community admins",
              onPressed: () {
                Navigator.pushNamed(context, '/community/settings/setCommunityAdmins');
              },
            ),
            ButtonSettingsListButton(
              text: "Edit community permissions",
              onPressed: () {
                Navigator.pushNamed(context, '/community/settings/editCommunityPermissions');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonSettingsListButton(
              text: "Create a new discussion group",
              onPressed: () {
                Navigator.pushNamed(context, "/discussionGroups/create");
              },
            ),
            ButtonSettingsListButton(
              text: "Create an event",
              onPressed: () {
                Navigator.pushNamed(context, '/events/createEvent');
              },
            ),
            ButtonSettingsListButton(
              text: "Invite new member",
              onPressed: () {
                Navigator.pushNamed(context, '/discussionGroups/addMembers');
              },
            ),
          ],
        ),
      ),
      backgroundColor: CustomColors.grey05,
    );
  }

  Container _headingSettingsListItem({required String text}) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: CustomColors.grey25Black)),
        color: CustomColors.grey05,
      ),
      height: boxHeight,
      width: double.infinity,
      child: InterText(
        padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
        text: text,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: CustomColors.grey75,
      ),
    );
  }
}
