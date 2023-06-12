import 'package:flutter/material.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../routes.dart';

class ChatSettings extends StatelessWidget {
  const ChatSettings({Key? key}) : super(key: key);

  final double _coverHeight = 170;
  final double _profileImageHeight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        leading: const CustomBackButtonWithCircle(),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileAndCoverImageSection(),
            _editGroupButton(context),
            _headingSection(title: "Fashion Events"),
            _topicAndDescription(context),
            const SizedBox(height: 20), // spacer
            _mediaSection(),
            _settingActionGroup(),
            const SizedBox(height: 20),
            _settingOptionGroup(),
            const SizedBox(height: 20),
          ],
        ),
      )
    );
  }

  Widget _settingOptionGroup() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
      child: Ink(
        decoration: BoxDecoration(
          color: CustomColors.grey05,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _settingOption(
              leftIcon: CustomIcons.help(),
              label: "Help / Support",
              iconRight: null,
              onPressed: (){}
            ),
            const Divider(
              indent: 15,
              endIndent: 15,
            ),
            _settingOption(
              leftIcon: CustomIcons.exit(),
              label: "Exit Group",
              iconRight: null,
              onPressed: (){}
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingActionGroup() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
      child: Ink(
        decoration: BoxDecoration(
          color: CustomColors.grey05,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _settingOption(
              leftIcon: CustomIcons.pin(width: 18),
              label: "Pinned Messages",
              iconRight: CustomIcons.arrowRight(),
              onPressed: (){}
            ),
            const Divider(
              indent: 15,
              endIndent: 15,
            ),
            _settingOption(
              leftIcon: CustomIcons.calendar,
              label: "Group Members",
              iconRight: CustomIcons.plus(),
              onPressed: (){}
            ),
            const Divider(
              indent: 15,
              endIndent: 15,
            ),
            _settingOption(
              leftIcon: CustomIcons.volumeDisabled(),
              label: "Notification",
              iconRight: const CustomFlutterSwitch(),
              onPressed: (){}
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingOption({
    required Widget leftIcon,
    required String label,
    required Widget? iconRight,
    required Function() onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                leftIcon,
                const SizedBox(width: 10),
                InterText(
                  text: label,
                ),
              ],
            ),
            if(iconRight != null)
              iconRight
          ],
        ),
      ),
    );
  }

  Widget _mediaSection() {
    return SizedBox(
      height: 125,
      child: Column(
        children: [
          Ink(
            child: InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(
                  left: CustomGlobal.paddingInline,
                  right: CustomGlobal.paddingInline,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeadingText4(
                      text: "Media",
                    ),
                    CustomIcons.arrowRight()
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: HeaderSubText(
                text: "No media available",
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _topicAndDescription(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.grey05,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      constraints: const BoxConstraints(
          minHeight: 50
      ),
      margin: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HeadingText5(
            text: "Topic",
          ),
          GestureDetector(
            onTap: (){
              Navigator.popAndPushNamed(context, SampleAppRouter.editGroupChat);
            },
            child: Container(
              padding: const EdgeInsets.only(
                  top: 15
              ),
              color: Colors.transparent,
              height: 55,
              child: const InterText(
                text: "What do you want to discuss?",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: CustomColors.grey75,
              ),
            ),
          ),
          const Divider(
            height: 6,
            color: CustomColors.grey25Black,
            thickness: 0.5,
          ),
          const SizedBox(
            height: 15,
          ),
          const HeadingText5(
            text: "Description",
          ),
          GestureDetector(
            onTap: (){
              Navigator.popAndPushNamed(context, SampleAppRouter.editGroupChat);
            },
            child: Container(
              padding: const EdgeInsets.only(
                  top: 15
              ),
              color: Colors.transparent,
              height: 65,
              child: const InterText(
                text: "Add group description",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: CustomColors.grey75,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _headingSection({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
      child: HeadingText3(
        text: title,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _editGroupButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: CustomGlobal.paddingInline / 2
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: CustomOutlinedButton(
          text: "Edit Group",
          onPressed: (){
            Navigator.popAndPushNamed(context, SampleAppRouter.editGroupChat);
          },
          verticalPadding: 8,
          horizontalPadding: 10,
          fontSize: 12,
          minimumSize: Size.zero,
          borderRadius: 8,
        ),
      ),
    );
  }

  Widget _profileAndCoverImageSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          "assets/sample_images/image1.png",
          width: double.infinity,
          fit: BoxFit.cover,
          height: _coverHeight,
        ),
        Positioned(
          top: _coverHeight - _profileImageHeight / 2,
          left: CustomGlobal.paddingInline,
          child: ProfilePictureImage2(
            imageAsset: "assets/sample_images/avatars/avatar7.png",
            size: _profileImageHeight,
            decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                BorderSide(
                    width: 3,
                    color: Colors.white
                ),
              ),
              borderRadius: BorderRadius.circular(300.0),
            ),
          ),
        ),
      ],
    );
  }
}
