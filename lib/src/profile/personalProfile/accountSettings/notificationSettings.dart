// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: const HeadingText5(
            text: "Notification Settings",
          ),
          centerTitle: true,
        ),
        body: Ink(
          child: ListView(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "MUTE COMMUNITY",
                        color: CustomColors.grey75,
                      ),
                      CustomFlutterSwitch(),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: CustomColors.grey25Black,
                thickness: 0.5,
                height: 6,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "DIRECT MESSAGE NOTIFICATION",
                        color: CustomColors.grey75,
                      ),
                      CustomFlutterSwitch(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "Notification Sound",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "In app sound",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "Vibrate",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: CustomColors.grey25Black,
                thickness: 0.5,
                height: 6,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "EVENT NOTIFICATION",
                        color: CustomColors.grey75,
                      ),
                      CustomFlutterSwitch(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "Notification Sound",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "In app sound",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "Vibrate",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: CustomColors.grey25Black,
                thickness: 0.5,
                height: 6,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "COURSE NOTIFICATION",
                        color: CustomColors.grey75,
                      ),
                      CustomFlutterSwitch(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "Notification Sound",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "In app sound",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "Vibrate",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: CustomColors.grey25Black,
                thickness: 0.5,
                height: 6,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "SHOP NOTIFICATION",
                        color: CustomColors.grey75,
                      ),
                      CustomFlutterSwitch(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "Notification Sound",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "In app sound",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InterText(
                        text: "Vibrate",
                      ),
                      SizedBox(height: 15, width: 15, child: CustomRadioButton()),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: MainBtn(
                  text: "Save changes",
                  onPressed: () {},
                  color: CustomColors.blue,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
