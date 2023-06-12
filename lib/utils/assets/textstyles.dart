// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:solid_social/utils/assets/colors.dart';

class InterText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final EdgeInsets padding;
  final TextOverflow? overflow;
  final int? maxLines;

  const InterText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.all(0.0),
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.headline4,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }
}

class TimesNewRomanText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final EdgeInsets padding;

  const TimesNewRomanText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color, fontFamily: 'Times New Roman'),
        textAlign: textAlign,
      ),
    );
  }
}

class BebasNeueText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final EdgeInsets padding;

  const BebasNeueText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: GoogleFonts.bebasNeue(
          textStyle: Theme.of(context).textTheme.headline4,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

class SpaceGrostekText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final EdgeInsets padding;

  const SpaceGrostekText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: GoogleFonts.spaceGrotesk(
          textStyle: Theme.of(context).textTheme.headline4,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

class RobotoSlabText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final EdgeInsets padding;

  const RobotoSlabText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: GoogleFonts.robotoSlab(
          textStyle: Theme.of(context).textTheme.headline4,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

class PacificoText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final EdgeInsets padding;

  const PacificoText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: GoogleFonts.pacifico(
          textStyle: Theme.of(context).textTheme.headline4,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

class CairoText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final EdgeInsets padding;

  const CairoText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: GoogleFonts.cairo(
          textStyle: Theme.of(context).textTheme.headline4,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

class InterTextFunction extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final void Function() onPressed;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final double paddingLeft;

  const InterTextFunction({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    this.color = Colors.black,
    this.paddingTop = 0.0,
    this.paddingRight = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      // behavior: HitTestBehavior.opaque,
      // onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          top: paddingTop,
          right: paddingRight,
          bottom: paddingBottom,
          left: paddingLeft,
        ),
        child: RichText(
          text: TextSpan(
            text: text,
            recognizer: TapGestureRecognizer()..onTap = onPressed,
            style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headline4,
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String text;
  final Color color;
  const HeadingText({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: Theme.of(context).textTheme.headline4,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: color,
      ),
    );
  }
}

class HeadingText2 extends StatelessWidget {
  final String text;
  const HeadingText2({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: Theme.of(context).textTheme.headline4,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }
}

class HeadingText3 extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;

  const HeadingText3({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: Theme.of(context).textTheme.headline3,
        color: textColor,
        fontSize: 20,
        fontWeight: fontWeight,
      ),
    );
  }
}

class HeadingText4 extends StatelessWidget {
  final String text;
  final Color color;
  const HeadingText4({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: Theme.of(context).textTheme.headline4,
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}

class HeadingText5 extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const HeadingText5({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16.00,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: Theme.of(context).textTheme.headline4,
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}

class HeaderSubText extends StatelessWidget {
  final String text;
  final Color textColor;
  final TextAlign textAlign;

  const HeaderSubText({
    super.key,
    required this.text,
    this.textColor = const Color(0xFF707070),
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: textColor,
        fontFamily: 'Inter',
      ),
    );
  }
}

class HeaderProfileNameText extends StatelessWidget {
  final String text;
  final String subtext;
  final Color textColor;
  final Color subtextColor;
  const HeaderProfileNameText({
    super.key,
    required this.text,
    this.subtext = "",
    this.textColor = Colors.black,
    this.subtextColor = CustomColors.grey75,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6,
        left: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InterText(
            text: text,
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          if (subtext.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: InterText(
                text: subtext,
                color: subtextColor,
                fontSize: 10,
              ),
            ),
        ],
      ),
    );
  }
}

class AddItemText extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onPressed;
  const AddItemText({
    super.key,
    required this.text,
    this.color = CustomColors.blue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
              top: 3,
            ),
            child: Icon(
              Icons.add,
              color: color,
              size: 18,
            ),
          ),
          InterText(
            text: text,
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}

class PostContentText extends StatelessWidget {
  final String text;
  final Color color;
  const PostContentText({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return InterText(
      text: text,
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }
}
