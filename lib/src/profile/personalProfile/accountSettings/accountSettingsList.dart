// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const HeadingText5(
          text: "Account Settings",
        ),
        centerTitle: true,
      ),
      backgroundColor: CustomColors.grey05,
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: CustomGlobal.paddingInline, top: CustomGlobal.paddingTop / 2),
            child: InterText(
              text: "PERSONALIZE YOUR ACCOUNT",
              color: CustomColors.grey75,
            ),
          ),
          const SizedBox(
            height: CustomGlobal.paddingTop / 2,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border.fromBorderSide(
                BorderSide(
                  color: CustomColors.grey25Black,
                  width: 0.5,
                ),
              ),
            ),
            child: Ink(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.personalSettings);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: CustomGlobal.paddingInline),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomIcons.person(),
                            const SizedBox(
                              width: 10,
                            ),
                            const InterText(
                              text: "Personal settings",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _divider(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.walletSettings);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: CustomGlobal.paddingInline),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomIcons.wallet(),
                            const SizedBox(
                              width: 10,
                            ),
                            const InterText(
                              text: "Wallet",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _divider(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.editInterests);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: CustomGlobal.paddingInline),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomIcons.heartOutlined(),
                            const SizedBox(
                              width: 10,
                            ),
                            const InterText(
                              text: "Edit Interests",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _divider(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.notificationSettings);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: CustomGlobal.paddingInline),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomIcons.volumeDisabled(),
                                const SizedBox(
                                  width: 10,
                                ),
                                const InterText(
                                  text: "Notification",
                                ),
                              ],
                            ),
                            const Align(alignment: Alignment.centerRight, child: CustomFlutterSwitch()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding:
                EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: CustomGlobal.paddingTop / 2),
            child: InterText(
              text: "PRIVACY SETTING",
              color: CustomColors.grey75,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border.fromBorderSide(
                BorderSide(
                  color: CustomColors.grey25Black,
                  width: 0.5,
                ),
              ),
            ),
            child: Ink(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.passwordSettings);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: CustomGlobal.paddingInline),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomIcons.padLock(),
                            const SizedBox(
                              width: 10,
                            ),
                            const InterText(
                              text: "Password settings",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _divider(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.privacySettings);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: CustomGlobal.paddingInline),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomIcons.eye(),
                            const SizedBox(
                              width: 10,
                            ),
                            const InterText(
                              text: "Privacy settings",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border.fromBorderSide(
                BorderSide(
                  color: CustomColors.grey25Black,
                  width: 0.5,
                ),
              ),
            ),
            child: Ink(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: CustomGlobal.paddingInline),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomIcons.exit(width: 18),
                            const SizedBox(
                              width: 10,
                            ),
                            const InterText(
                              text: "Leave Community",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _divider(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: CustomGlobal.paddingInline),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomIcons.trash(),
                            const SizedBox(
                              width: 10,
                            ),
                            const InterText(
                              text: "Delete My Account",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      color: CustomColors.grey25Black,
      thickness: 0.5,
      height: 6,
    );
  }
}
