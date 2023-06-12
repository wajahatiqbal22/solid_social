// Flutter imports:
import 'package:flutter/material.dart';
import 'package:solid_social/utils/GLOBAL.dart';
// Project imports:
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import 'package:solid_social/utils/assets/video_chats.dart';

class VideoChatScreen extends StatelessWidget {
  const VideoChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeadingText5(
              text: "The essence of fashion",
              fontSize: 14,
            ),
            Container(
              constraints: const BoxConstraints(
                minWidth: 150,
              ),
              width: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcons.personTwo2(width: 18),
                  const SizedBox(
                    width: 5,
                  ),
                  const InterText(
                    text: "10 participants",
                    fontSize: 10,
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: CustomGlobal.paddingInline / 2),
            child: CustomIcons.profileAdd,
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: CustomGlobal.paddingInline / 2, right: CustomGlobal.paddingInline / 2, bottom: 150),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: const [
                  VideoChatCard(
                    color: CustomColors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  VideoChatCard(
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: const [
                  VideoChatCard(
                    color: Colors.pinkAccent,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  VideoChatCard(
                    color: Colors.deepPurpleAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
