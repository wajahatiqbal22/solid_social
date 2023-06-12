// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const HeadingText5(
          text: "Privacy Settings",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: CustomGlobal.paddingTop,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: InterText(
                  text: "VISIBILITY - WHO CAN VIEW MY POSTS",
                  color: CustomColors.grey75,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InterText(
                      text: "Public",
                    ),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InterText(
                      text: "Private, only me can view",
                    ),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InterText(
                      text: "People on the same group can view",
                    ),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InterText(
                      text: "Everybody, except",
                    ),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: CustomColors.grey25Black,
                thickness: 0.5,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: InterText(
                  text: "WHO CAN ADD YOU TO DISCUSSION GROUP",
                  color: CustomColors.grey75,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InterText(
                      text: "Everyone",
                    ),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InterText(
                      text: "Friends",
                    ),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 0.5,
                color: CustomColors.grey25Black,
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: InterText(
                  text: "EMAIL AND PHONE NUMBER VISIBILITY",
                  color: CustomColors.grey75,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InterText(
                      text: "Stephenpaul@hotmail.com",
                    ),
                    CustomFlutterSwitch(),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InterText(
                      text: "+234785645678",
                    ),
                    CustomFlutterSwitch(),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: MainBtn(
                  color: CustomColors.blue,
                  textColor: Colors.white,
                  text: "Save changes",
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
