// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class Dropzone1 extends StatelessWidget {
  final String text;
  const Dropzone1({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      constraints: const BoxConstraints(
        minHeight: 50,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.blue50,
        borderRadius: BorderRadius.circular(10),
        border: const Border.fromBorderSide(
          BorderSide(
            color: CustomColors.grey25Black,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIcons.cloud(),
          const SizedBox(
            width: 10,
          ),
          const InterText(
            text: "Select to browse images",
            color: CustomColors.grey75,
          ),
        ],
      ),
    );
  }
}
