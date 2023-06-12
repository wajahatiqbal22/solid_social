// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class EditCommunityPermissionsScreen extends StatelessWidget {
  const EditCommunityPermissionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText3(
          text: "Edit community permissions",
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: CustomGlobal.paddingTop,
              ),
              const Padding(
                padding: EdgeInsets.only(left: CustomGlobal.paddingInline),
                child: HeaderSubText(
                  text: "Select community type",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    InterText(text: "Private Community"),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(
                        isChecked: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InterText(text: "Public Community"),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Divider(
                  height: 30,
                  color: CustomColors.grey25Black,
                  thickness: 0.5,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: CustomGlobal.paddingInline),
                child: HeaderSubText(
                  text: "Who can join the community",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    InterText(text: "Anyone can join"),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(
                        isChecked: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InterText(text: "Only people with the invite link"),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Divider(
                  height: 30,
                  color: CustomColors.grey25Black,
                  thickness: 0.5,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: CustomGlobal.paddingInline),
                child: HeaderSubText(
                  text: "Who can invite members into the community",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    InterText(text: "Admins only"),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(
                        isChecked: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InterText(text: "Everyone"),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CustomRadioButton(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                child: Divider(
                  height: 30,
                  color: CustomColors.grey25Black,
                  thickness: 0.5,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: CustomGlobal.marginBottomButtons),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: MainBtn(
              text: "Save changes",
              onPressed: () {},
              color: CustomColors.blue,
              textColor: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
