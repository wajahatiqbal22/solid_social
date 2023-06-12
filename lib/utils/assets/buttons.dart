// Flutter imports:

import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solid_social/utils/assets/icons.dart';
// Project imports:
import 'package:solid_social/utils/assets/textstyles.dart';

import 'colors.dart';

const double _defaultWidth = 350;
const double _defaultHeight = 50;
const _defaultColor = Colors.white;
const _defaultTextColor = Colors.black;

/// This Widget Creates Main Button
///
class MainBtn extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final double width;
  final double height;
  final double bottomMargin;
  final Function? onPressed;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final double? elevation;
  final bool isLoading;
  final BorderSide? side;

  const MainBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = _defaultColor,
    this.textColor = _defaultTextColor,
    this.width = _defaultWidth,
    this.height = _defaultHeight,
    this.bottomMargin = 10,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.elevation,
    this.isLoading = false,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      padding: EdgeInsets.only(
          top: paddingTop,
          right: paddingRight,
          bottom: paddingBottom,
          left: paddingLeft),
      child: ElevatedButton(
        onPressed: () => onPressed?.call(),
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed == null ? Colors.grey : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: elevation,
          side: side,
        ),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ))
              : Text(
                  text,
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

class MainBtnIcon extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final double width;
  final double height;
  final double bottomMargin;
  final Function onPressed;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final dynamic icon;
  final double? elevation;

  const MainBtnIcon({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.color = _defaultColor,
    this.textColor = _defaultTextColor,
    this.width = _defaultWidth,
    this.height = _defaultHeight,
    this.bottomMargin = 10,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      padding: EdgeInsets.only(
          top: paddingTop,
          right: paddingRight,
          bottom: paddingBottom,
          left: paddingLeft),
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          elevation: elevation,
        ),
        icon: icon,
        label: Text(
          text,
          style: GoogleFonts.inter(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class MainBtnIcon2 extends StatelessWidget {
  final Widget text;
  final Widget icon;
  final Color backgroundColor;
  final double elevation;
  final double borderRadius;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Color shadowColor;

  const MainBtnIcon2({
    super.key,
    required this.text,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.elevation = 1,
    this.borderRadius = 10,
    this.width = double.infinity,
    this.height = 50,
    this.padding = const EdgeInsets.all(0),
    this.shadowColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: icon,
        label: text,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: const BorderSide(
                width: 0.5, color: Color.fromRGBO(0, 0, 0, 0.1)),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

class MainBtnSvg extends StatelessWidget {
  final String text;
  final dynamic svg;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final dynamic onPressed;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final Color shadowColor;
  final BoxDecoration decoration;
  final bool isLoading;

  const MainBtnSvg({
    super.key,
    required this.text,
    required this.svg,
    required this.onPressed,
    this.color = _defaultColor,
    this.textColor = _defaultTextColor,
    this.height = _defaultHeight,
    this.width = _defaultWidth,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginTop = 0.0,
    this.isLoading = false,
    this.shadowColor = Colors.transparent,
    this.decoration = const BoxDecoration(boxShadow: [
      BoxShadow(
        color: Color(0x0D000000),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 4),
      ),
    ]),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      height: height,
      width: width,
      padding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
          top: paddingTop,
          bottom: paddingBottom),
      margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
          top: marginTop,
          bottom: marginBottom),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: Color(0xFFD3DCE4),
                width: 0.5,
              ),
            ),
          ),
          shadowColor: MaterialStateProperty.all(shadowColor),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            svg,
            isLoading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
            Opacity(
              opacity: 0,
              child: svg,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNavBarIcons extends StatelessWidget {
  final String asset;
  final double width;
  final Function() onPressed;

  const CustomNavBarIcons({
    super.key,
    required this.onPressed,
    required this.asset,
    this.width = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: Colors.white,
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          asset,
          width: width,
        ),
      ),
    );
  }
}

class CustomGridButton extends StatelessWidget {
  final String text;
  final bool isFocused;
  final VoidCallback? onPressed;
  final bool isChip;
  final VoidCallback? onChipRemoveClick;

  const CustomGridButton(
      {super.key,
      required this.text,
      this.isFocused = false,
      this.onPressed,
      this.isChip = false,
      this.onChipRemoveClick});

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    FontWeight fontWeight = FontWeight.normal;
    Color borderColor = CustomColors.grey25Black;

    if (isFocused) {
      textColor = CustomColors.blue;
      borderColor = CustomColors.blue;
      fontWeight = FontWeight.w600;
    }

    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            InterText(
              text: text,
              color: textColor,
              fontWeight: fontWeight,
            ),
            const SizedBox(width: 5.0),
            isChip && isFocused == true
                ? GestureDetector(
                    onTap: onChipRemoveClick,
                    child: CustomIcons.close2(
                        width: 10.0, color: CustomColors.blue))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final Size? minimumSize;
  final double borderRadius;
  final Color? textColor;
  final Color? buttonColor;

  const CustomOutlinedButton(
      {super.key,
      required this.onPressed,
      this.text = "Join",
      this.verticalPadding = 10,
      this.horizontalPadding = 0,
      this.fontSize = 14,
      this.minimumSize,
      this.borderRadius = 10,
      this.textColor,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: const BorderSide(
          color: CustomColors.grey25Black,
          width: 1,
        ),
        backgroundColor: buttonColor,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        minimumSize: minimumSize,
      ),
      child: InterText(
        text: text,
        color: textColor ?? CustomColors.blue,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      ),
    );
  }
}

class CustomOutlinedButtonIcon extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final Size? minimumSize;
  final double borderRadius;

  const CustomOutlinedButtonIcon({
    super.key,
    required this.onPressed,
    this.child = const InterText(
      text: "Join",
      color: CustomColors.blue,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    this.verticalPadding = 10,
    this.horizontalPadding = 0,
    this.fontSize = 14,
    this.minimumSize,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: const BorderSide(
          color: CustomColors.grey25Black,
          width: 1,
        ),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        minimumSize: minimumSize,
        alignment: Alignment.center,
      ),
      child: child,
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({
    Key? key,
    required this.onChanged,
    this.isSelected = false,
  }) : super(key: key);

  final Function(bool)? onChanged;
  bool isSelected;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: Checkbox(
        side: const BorderSide(
          width: 1,
          color: CustomColors.grey50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        value: widget.isSelected,
        onChanged: (bool? isChecked) {
          setState(() {
            widget.isSelected = isChecked!;
            widget.onChanged?.call(widget.isSelected);
          });
        },
      ),
    );
  }
}

/// TODO:
/// - fix isChecked (is inverted)
class CustomRadioButton extends StatefulWidget {
  final bool isChecked;
  const CustomRadioButton({
    Key? key,
    this.isChecked = true,
  }) : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: CustomColors.grey25Black),
      child: Radio<bool>(
        value: widget.isChecked,
        groupValue: _isChecked,
        onChanged: (isChecked) {
          setState(() {
            _isChecked = !_isChecked;
          });
        },
        toggleable: true,
        activeColor: CustomColors.blue,
      ),
    );
  }
}

class CustomFlutterSwitch extends StatefulWidget {
  const CustomFlutterSwitch({Key? key}) : super(key: key);

  @override
  State<CustomFlutterSwitch> createState() => _CustomFlutterSwitchState();
}

class _CustomFlutterSwitchState extends State<CustomFlutterSwitch> {
  bool _makePrivateStatus = false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      value: _makePrivateStatus,
      width: 35,
      height: 20,
      padding: 2,
      toggleSize: 15,
      activeColor: CustomColors.blue,
      inactiveColor: CustomColors.grey25Black,
      onToggle: (val) {
        setState(() {
          _makePrivateStatus = val;
        });
      },
    );
  }
}

class CustomDropdownButton<T> extends StatefulWidget {
  const CustomDropdownButton({
    Key? key,
    required this.items,
    this.onChanged,
    this.controller,
    this.value,
  }) : super(key: key);

  final List<DropdownMenuItem<T>>? items;
  final void Function(T? value)? onChanged;
  final TextEditingController? controller;
  final T? value;

  @override
  State<CustomDropdownButton<T>> createState() =>
      _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
        value: widget.value,
        validator: (v) {
          if (v == null) return "This field is mandatory";
          return null;
        },
        icon: const Icon(Iconsax.arrow_down_1),
        elevation: 16,
        style: const TextStyle(color: CustomColors.grey75),
        isExpanded: true,
        decoration: InputDecoration(
          fillColor: CustomColors.blue50,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 2,
              color: CustomColors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: CustomColors.grey25Black,
              width: 0.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        borderRadius: BorderRadius.circular(10.0),
        onChanged: widget.onChanged,
        items: widget.items);
  }
}

class CommentsButton extends StatelessWidget {
  final int? commentCount;
  final int? replyCount;
  final VoidCallback? onTap;

  const CommentsButton({
    super.key,
    this.commentCount,
    this.replyCount,
    this.onTap,
  }) : assert((commentCount != null && replyCount == null) ||
            (replyCount != null && commentCount == null));

  final double minCommentButtonWidth = 45;
  final double minCommentButtonHeight = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: minCommentButtonHeight,
      padding: const EdgeInsets.only(
        right: 8,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: minCommentButtonHeight,
          maxHeight: minCommentButtonHeight,
          minWidth: minCommentButtonWidth,
        ),
        child: OutlinedButton.icon(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            side: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            minimumSize: Size(minCommentButtonWidth, minCommentButtonHeight),
          ),
          icon: SvgPicture.asset(
            "assets/custom_icons/comment.svg",
          ),
          label: commentCount != null
              ? PostContentText(
                  text: commentCount! > 0
                      ? commentCount! > 500
                          ? "500+ Comments"
                          : "$commentCount Comments"
                      : "Comment",
                )
              : PostContentText(
                  text: replyCount! > 0
                      ? replyCount! > 500
                          ? "500+ Replies"
                          : "$replyCount Replies"
                      : "Reply",
                ),
        ),
      ),
    );
  }
}
