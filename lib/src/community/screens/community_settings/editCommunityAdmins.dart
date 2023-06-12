// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class EditCommunityAdminsScreen extends StatelessWidget {
  const EditCommunityAdminsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText3(
          text: "Edit community admins",
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: CustomGlobal.marginBottomButtons,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: CustomGlobal.paddingInline),
                  child: InterText(
                    text: "Community admins",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      ProfilePictureImage(
                        asset: "assets/sample_images/avatars/avatar4.png",
                        width: 55,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InterText(
                        text: "Stephen Paul",
                        fontSize: 14,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InterText(text: "Founder"),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: CustomColors.grey25Black,
                  height: 20,
                  thickness: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      ProfilePictureImage(
                        asset: "assets/sample_images/avatars/avatar5.png",
                        width: 55,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InterText(
                        text: "Grace Barlow",
                        fontSize: 14,
                      ),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.close_outlined,
                              color: Colors.red,
                            )),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: CustomColors.grey25Black,
                  height: 20,
                  thickness: 0.5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: CustomGlobal.paddingInline),
                  child: InterText(
                    text: "Add new admins",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 10),
                  child: InputField(
                    placeholder: "Search Name",
                    placeholderSize: 12,
                    prefixIcon: CustomIcons.search(
                      color: CustomColors.grey75,
                      width: 20,
                    ),
                    contentPadding: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: CustomGlobal.paddingInline, right: CustomGlobal.paddingInline, top: 15, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: const [
                              ProfilePictureImage(
                                asset: "assets/sample_images/avatars/avatar3.png",
                                width: 55,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InterText(
                                text: "Cindy Moses",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          )
                        ],
                      ),
                      CustomCheckBox(onChanged: (checked) {}),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: CustomGlobal.paddingInline, right: CustomGlobal.paddingInline, top: 15, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: const [
                              ProfilePictureImage(
                                asset: "assets/sample_images/avatars/avatar2.png",
                                width: 55,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InterText(
                                text: "James J",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          )
                        ],
                      ),
                      CustomCheckBox(onChanged: (checked) {}),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: CustomGlobal.marginBottomButtons),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MainBtn(
                text: "Save Changes",
                onPressed: () {},
                color: CustomColors.blue,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
