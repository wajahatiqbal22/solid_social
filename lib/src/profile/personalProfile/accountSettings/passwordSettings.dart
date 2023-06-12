// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class PasswordSettingsScreen extends StatelessWidget {
  const PasswordSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const HeadingText5(
          text: "Password Settings",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: CustomGlobal.paddingTop,
              ),
              const HeadingText5(
                text: "Change your password",
              ),
              const SizedBox(
                height: 15,
              ),
              const InputField(
                labelText: "Current Password",
                labelStyle: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              const InputField(
                labelText: "New Password",
                labelStyle: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              const InputField(
                labelText: "Confirm New Password",
                labelStyle: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 60,
              ),
              MainBtn(
                text: "Save Changes",
                onPressed: () {},
                textColor: Colors.white,
                color: CustomColors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
