// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class PersonalSettingsScreen extends StatelessWidget {
  const PersonalSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const CustomBackButton(),
            title: const HeadingText5(
              text: "Personal Settings",
            ),
            centerTitle: true),
        body: ListView(
          padding: const EdgeInsets.only(
              left: CustomGlobal.paddingInline, right: CustomGlobal.paddingInline, top: CustomGlobal.paddingTop),
          children: [
            const InterText(
              text: "Edit your personal details",
              color: CustomColors.grey75,
            ),
            const SizedBox(
              height: CustomGlobal.paddingTop,
            ),
            const InputField(
              labelText: "Description",
              textStyle: TextStyle(fontSize: 12),
              labelStyle: TextStyle(fontSize: 14),
              initialValue: "Grace",
            ),
            const SizedBox(
              height: 15,
            ),
            const InputField(
              labelText: "Last Name",
              textStyle: TextStyle(fontSize: 12),
              labelStyle: TextStyle(fontSize: 14),
              initialValue: "Barlow",
            ),
            const SizedBox(
              height: 15,
            ),
            const InputField(
              labelText: "Email",
              textStyle: TextStyle(fontSize: 12),
              labelStyle: TextStyle(fontSize: 14),
              initialValue: "Gracebarlow@gmail.com",
            ),
            const SizedBox(
              height: 15,
            ),
            const InputField(
              labelText: "Phone Number",
              textStyle: TextStyle(fontSize: 12),
              labelStyle: TextStyle(fontSize: 14),
              initialValue: "+234785645678",
            ),
            const SizedBox(
              height: 60,
            ),
            MainBtn(
              text: "Save Changes",
              onPressed: () {},
              color: CustomColors.blue,
              textColor: Colors.white,
            ),
          ],
        ));
  }
}
