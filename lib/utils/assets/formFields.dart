// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:iconsax/iconsax.dart';

// Project imports:
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class InputField extends StatelessWidget {
  final String? placeholder;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final bool obscureText;
  final double width;
  final int limit;
  final Widget? prefixIcon;
  final double prefixIconWidth;
  final double contentPadding;
  final double placeholderSize;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color fillColor;
  final bool enableBorder;
  final bool isDense;
  final String? labelText;
  final String? initialValue;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final int? maxLines;
  final bool? readOnly;
  final Function()? onTap;

  const InputField({
    super.key,
    this.placeholder,
    this.paddingLeft = 0.0,
    this.paddingTop = 0.0,
    this.paddingRight = 0.0,
    this.paddingBottom = 0.0,
    this.obscureText = false,
    this.width = double.infinity,
    this.limit = 255,
    this.prefixIcon,
    this.prefixIconWidth = 35,
    this.contentPadding = 20,
    this.placeholderSize = 12,
    this.controller,
    this.validator,
    this.fillColor = const Color(0xFFF4FAFF),
    this.enableBorder = true,
    this.isDense = false,
    this.labelText,
    this.initialValue,
    this.textStyle,
    this.labelStyle,
    this.maxLines = 1,
    this.readOnly,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: paddingLeft, top: paddingTop, right: paddingRight, bottom: paddingBottom),
      width: width,
      child: TextFormField(
        validator: validator,
        controller: controller,
        maxLength: limit,
        onTap: onTap,
        readOnly: readOnly ?? false,
        style: textStyle,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: prefixIcon,
                )
              : null,
          isDense: isDense,
          prefixIconConstraints: BoxConstraints(maxWidth: prefixIconWidth),
          hintText: placeholder,
          labelText: labelText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: placeholderSize,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: enableBorder ? const Color(0xFFD3DCE4) : Colors.transparent,
              width: 0.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: CustomColors.blue, width: 1.5),
          ),
          filled: true,
          fillColor: fillColor,
          contentPadding: EdgeInsets.all(contentPadding),
          border: const OutlineInputBorder(),
          counterText: '',
          labelStyle: labelStyle,
        ),
        initialValue: initialValue,
        obscureText: obscureText,
      ),
    );
  }
}

class InputFieldCopy extends StatelessWidget {
  final String placeholder;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final bool obscureText;
  final double width;
  final int limit;
  final VoidCallback onActionClicked;

  const InputFieldCopy({
    super.key,
    required this.placeholder,
    this.paddingLeft = 0.0,
    this.paddingTop = 0.0,
    this.paddingRight = 0.0,
    this.paddingBottom = 0.0,
    this.obscureText = false,
    this.width = double.infinity,
    this.limit = 255,
    required this.onActionClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: paddingLeft, top: paddingTop, right: paddingRight, bottom: paddingBottom),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                TextFormField(
                  maxLength: limit,
                  readOnly: true,
                  enabled: false,
                  autofocus: false,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFD3DCE4), width: 0.0),
                    ),
                    // labelText: placeholder,
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    hintText: placeholder,
                    // labelStyle: const TextStyle(
                    //   fontWeight: FontWeight.w400,
                    //   fontSize: 12,
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFD3DCE4), width: 0.0),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF4FAFF),
                    contentPadding: const EdgeInsets.all(20),
                    border: const OutlineInputBorder(),
                    counterText: '',
                  ),
                  obscureText: obscureText,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: GestureDetector(
                    onTap: onActionClicked,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Iconsax.copy,
                          color: Colors.blue,
                        ),
                        InterTextFunction(
                          text: "Copy",
                          onPressed: onActionClicked,
                          color: CustomColors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final String placeholder;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final bool obscureText;
  final double width;
  final int limit;
  final Widget? prefixIcon;
  final double prefixIconWidth;
  final double contentPadding;
  final double placeholderSize;
  final void Function(String value)? onChanged;
  final bool? backAutoFocus;
  final bool? frontAutoFocus;

  const OtpInput({
    super.key,
    required this.placeholder,
    this.paddingLeft = 0.0,
    this.paddingTop = 0.0,
    this.paddingRight = 0.0,
    this.paddingBottom = 0.0,
    this.obscureText = false,
    this.width = double.infinity,
    this.limit = 255,
    this.prefixIcon,
    this.prefixIconWidth = 35,
    this.contentPadding = 20,
    this.placeholderSize = 12,
    this.onChanged,
    this.backAutoFocus = false,
    this.frontAutoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: paddingLeft, top: paddingTop, right: paddingRight, bottom: paddingBottom),
      width: width,
      child: TextFormField(
        validator: (v) {
          if (v?.isEmpty ?? false) {
            return "";
          }

          return null;
        },
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          if (value.isEmpty) {
            if (backAutoFocus!) {
              FocusScope.of(context).previousFocus();
            }
          } else {
            if (frontAutoFocus!) FocusScope.of(context).nextFocus();
          }

          onChanged?.call(value);
        },
        maxLength: limit,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: prefixIcon,
                )
              : null,
          prefixIconConstraints: BoxConstraints(maxWidth: prefixIconWidth),
          hintText: placeholder,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: placeholderSize,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD3DCE4), width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: CustomColors.blue, width: 1.5),
          ),
          filled: true,
          fillColor: const Color(0xFFF4FAFF),
          contentPadding: EdgeInsets.all(contentPadding),
          border: const OutlineInputBorder(),
          counterText: '',
        ),
        obscureText: obscureText,
      ),
    );
  }
}
