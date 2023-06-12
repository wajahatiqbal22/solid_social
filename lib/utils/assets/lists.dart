// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import 'images.dart';

class CustomListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final String buttonText;
  final double boxWidth;
  final bool enableButton;
  final double paddingBottom;
  final Function() onButtonPressed;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomListItem({
    super.key,
    required this.title,
    this.imageUrl,
    required this.onButtonPressed,
    this.subtitle = "",
    this.buttonText = "Join",
    this.boxWidth = 150,
    this.enableButton = false,
    this.paddingBottom = 15,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enableButton ? null : onButtonPressed,
      child: Padding(
        padding: EdgeInsets.only(bottom: paddingBottom),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            if (imageUrl == null)
              CircularNameInitials(name: title)
            else
              CircleAvatar(backgroundImage: NetworkImage(imageUrl!)),
            SizedBox(
              width: boxWidth,
              child: HeaderProfileNameText(
                text: title,
                subtext: subtitle,
              ),
            ),
            if (enableButton)
              Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomOutlinedButton(
                      text: buttonText,
                      onPressed: onButtonPressed,
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
