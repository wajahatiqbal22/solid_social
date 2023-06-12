// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/colors.dart';

import '../../../../utils/assets/buttons.dart';
import '../../../../utils/assets/textstyles.dart';

class CommunityCreatedSuccessScreen extends StatelessWidget {
  final double _paddingInline = 25;
  const CommunityCreatedSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context.currentRoute);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/homepage");
              },
              child: const Icon(Icons.close, color: Colors.white),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: CustomColors.blue,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Center(
                  child: SvgPicture.asset("assets/backgrounds/community/party-success.svg"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Center(
                  child: HeadingText3(
                    text: "Community Created",
                    textColor: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Center(
                  child: HeaderSubText(
                    text:
                        "Dont forget to update community bio and other statuses under community settings. Enjoy your stay on Solid Social ✌️",
                    textColor: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: _paddingInline, right: _paddingInline),
              child: MainBtn(
                onPressed: () {
                  context.pop();
                },
                text: "Go to Community",
                color: Colors.white,
                textColor: CustomColors.blue,
                width: double.infinity,
                bottomMargin: CustomGlobal.marginBottomButtons,
              ),
            ),
          )
        ],
      ),
    );
  }
}
