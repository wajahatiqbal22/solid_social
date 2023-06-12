// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/dropZones.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class EditCommunityNameLogoScreen extends StatelessWidget {
  const EditCommunityNameLogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText3(
          text: "Edit community name and logo",
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: CustomGlobal.paddingInline, right: CustomGlobal.paddingInline, top: CustomGlobal.paddingTop),
            child: Column(
              children: const [
                InputField(
                  placeholder: "Edit community name",
                ),
                SizedBox(
                  height: 25,
                ),
                Dropzone1(
                  text: "Select to browse images",
                ),
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
