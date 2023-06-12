import 'package:flutter/material.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';

class RetryPermission extends StatelessWidget {
  const RetryPermission({
    required this.onRetry,
    Key? key,
  }) : super(key: key);

  final Function()? onRetry;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Solid Social needs camera and microphone permissions to continue the call",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          MainBtn(
            text: "Retry",
            textColor: Colors.white,
            onPressed: () {
              onRetry?.call();
            },
            color: CustomColors.blue,
          )
        ],
      ),
    );
  }
}
