// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import 'colors.dart';

class DrawerHeaderButtonList extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onPressed;
  const DrawerHeaderButtonList({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon = const Icon(null),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            color: CustomColors.grey25,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InterText(
                  text: text,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          icon,
        ],
      ),
    );
  }
}

class CustomBackButtonWithCircle extends StatelessWidget {
  const CustomBackButtonWithCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: CustomColors.grey100,
            borderRadius: BorderRadius.circular(300.0),
          ),
          width: 35,
          height: 35,
        ),
        IconButton(
          onPressed: null,
          icon: GestureDetector(
            onTap: () {
              Navigator.maybePop(context);
            },
            child: CustomIcons.arrowLeft(color: Colors.white),
          ),
          padding: EdgeInsets.zero,
        )
      ],
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      icon: CustomIcons.arrowLeft(),
    );
  }
}
