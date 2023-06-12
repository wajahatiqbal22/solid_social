import 'package:flutter/material.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const HeadingText5(
          text: "Donate",
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
        child: ListView(
          children: const [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              child: InterText(
                text: "You're about to make a donation to Lagos",
                color: CustomColors.grey75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
