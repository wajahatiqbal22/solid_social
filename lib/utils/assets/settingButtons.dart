// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:solid_social/utils/assets/textstyles.dart';

import '../../src/community/screens/community_settings/communitySettings.dart';
import '../GLOBAL.dart';
import 'colors.dart';

class ButtonSettingsListButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const ButtonSettingsListButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: CustomColors.grey25Black)),
        color: Colors.white,
      ),
      height: CommunitySettings.boxHeight,
      width: double.infinity,
      child: InkWell(
        onTap: onPressed,
        child: Align(
          alignment: Alignment.centerLeft,
          child: InterText(
            padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
            text: text,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
