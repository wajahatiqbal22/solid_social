import 'package:flutter/material.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class SampleFundraiserScreen extends StatelessWidget {
  const SampleFundraiserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const HeadingText5(
          text: "Fundraiser",
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: (){},
              icon: CustomIcons.share2(
                color: Colors.black
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              "assets/sample_images/fashion-cover.png",
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline,
              vertical: 15,
            ),
            child: HeadingText5(
              text: "Lagos Fashion Week 2022 Event planning",
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline
            ),
            child: LinearProgressIndicator(
              color: CustomColors.blue,
              backgroundColor: CustomColors.grey25Black,
              value: 0.5,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline
            ),
            child: Row(
              children: [
                CustomIcons.money(
                  size: 30
                ),
                const SizedBox(
                  width: 15,
                ),
                const InterText(
                  text: "\$24,000 Raised ",
                  color: CustomColors.blue,
                ),
                const InterText(
                  text: "of \$50,000 goal",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline,
              vertical: 10,
            ),
            child: Row(
              children: [
                CustomIcons.heartPerson(
                  width: 30
                ),
                const SizedBox(
                  width: 15,
                ),
                const InterText(
                  text: "50 Donors",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          MainBtn(
            text: "Donate Now",
            onPressed: (){},
            paddingLeft: CustomGlobal.paddingInline,
            paddingRight: CustomGlobal.paddingInline,
            color: CustomColors.blue,
            textColor: Colors.white,
            elevation: 0,
          ),
        ],
      )
    );
  }
}

