// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

// Project imports:
import 'package:solid_social/utils/assets/textstyles.dart';

class CustomIcons {
  const CustomIcons._();

  static SvgPicture copy = SvgPicture.asset("assets/custom_icons/copy.svg");

  static SvgPicture email = SvgPicture.asset("assets/custom_icons/sms.svg");

  static SvgPicture contacts = SvgPicture.asset("assets/custom_icons/people.svg");

  static SvgPicture notifications = SvgPicture.asset(
    'assets/custom_icons/notification.svg',
    color: Colors.black,
    width: 24,
  );

  static SvgPicture addBottomBar = SvgPicture.asset("assets/custom_icons/bottom_nav/outlined/plus.svg");

  static SvgPicture addBottomBar2({double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/bottom_nav/outlined/plus.svg",
      width: width,
    );
  }

  static SvgPicture firstLine = SvgPicture.asset("assets/custom_icons/firstline.svg");

  static SvgPicture createStory = SvgPicture.asset("assets/custom_icons/createStory.svg");

  static SvgPicture calendar = SvgPicture.asset("assets/custom_icons/calendar.svg");

  static SvgPicture calendar2({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/calendar.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture users = SvgPicture.asset("assets/custom_icons/2person.svg");

  static SvgPicture profileAdd = SvgPicture.asset("assets/custom_icons/profile-add.svg");

  static SvgPicture postOptions({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/post_options.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture personTwo2({Color? color, double? width}) {
    return SvgPicture.asset("assets/custom_icons/bottom_nav/outlined/2person.svg", color: color, width: width);
  }

  static SvgPicture personTwoBold({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/bottom_nav/bold/2person.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture share2({Color? color, double? width}) {
    return SvgPicture.asset("assets/custom_icons/export.svg", color: color, width: width);
  }

  static SvgPicture close2({Color? color, double? width}) {
    return SvgPicture.asset("assets/custom_icons/close.svg", color: color, width: width);
  }

  static SvgPicture camera2({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/camera.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture emailAt({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/emailAt.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture tag({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/tag.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture search({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/bottom_nav/outlined/search.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture searchBold({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/bottom_nav/bold/search.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture homeBold({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/bottom_nav/bold/home.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture personBold({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/bottom_nav/bold/person.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture cloud({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/cloud.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture settings({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/setting-2.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture call({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/call.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture video({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/video.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture microphone({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/microphone-2.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture back({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/arrow-left.svg",
      color: color,
      width: width,
    );
  }

  static Icon arrowRight({Color? color, double? size}) {
    return Icon(
      Iconsax.arrow_right_34,
      color: color,
      size: size,
    );
  }

  static SvgPicture pin({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/pin.svg",
      color: color,
      width: width,
    );
  }

  static Icon arrowLeft({Color? color, double? size}) {
    return Icon(
      Iconsax.arrow_left_2,
      color: color,
      size: size,
    );
  }

  static Icon plus({Color? color, double? size}) {
    return Icon(
      Icons.add,
      color: color,
      size: size,
    );
  }

  static Icon volumeDisabled({Color? color, double? size}) {
    return Icon(
      Iconsax.volume_slash,
      color: color,
      size: size,
    );
  }

  static SvgPicture exit({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/exit.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture help({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/help.svg",
      color: color,
      width: width,
    );
  }

  static Icon editGallery({Color? color, double? size}) {
    return Icon(
      Iconsax.gallery_edit4,
      color: color,
      size: size,
    );
  }

  static Icon person({Color? color, double? size}) {
    return Icon(
      Iconsax.user,
      color: color,
      size: size,
    );
  }

  static Icon wallet({Color? color, double? size}) {
    return Icon(
      Iconsax.wallet_1,
      color: color,
      size: size,
    );
  }

  static Icon heartOutlined({Color? color, double? size}) {
    return Icon(Iconsax.heart, color: color, size: size);
  }

  static Icon padLock({Color? color, double? size}) {
    return Icon(
      Iconsax.lock,
      color: color,
      size: size,
    );
  }

  static Icon eye({Color? color, double? size}) {
    return Icon(
      Iconsax.eye,
      color: color,
      size: size,
    );
  }

  static Icon trash({Color? color, double? size}) {
    return Icon(Iconsax.trash, color: color, size: size);
  }

  static Icon shoppingCart({Color? color, double? size}) {
    return Icon(
      Iconsax.shopping_cart,
      color: color,
      size: size,
    );
  }

  static SvgPicture allTransaction({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/finances_icon.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture fundraiserHeart({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/fundraiser_heart.svg",
      color: color,
      width: width,
    );
  }

  static Icon money({Color? color, double? size}) {
    return Icon(
      Iconsax.money,
      color: color,
      size: size,
    );
  }

  static SvgPicture heartPerson({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/heart-person.svg",
      color: color,
      width: width,
    );
  }

  static Icon strongBox_bold({Color? color, double? size}) {
    return Icon(
      Iconsax.strongbox5,
      color: color,
      size: size,
    );
  }

  static SvgPicture walletBold({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/wallet.svg",
      color: color,
      width: width,
    );
  }

  static Icon cardBold({Color? color, double? size}) {
    return Icon(
      Iconsax.card5,
      color: color,
      size: size,
    );
  }

  static SvgPicture google({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/google.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture importBold({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/import_bold.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture exportBold({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/export_bold.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture postOptionsVertical({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/postOptionsVertical.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture arrowDown({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/arrow-down.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture arrowUp({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/arrow-up.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture send({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/send.svg",
      color: color,
      width: width,
    );
  }

  static SvgPicture receive({Color? color, double? width}) {
    return SvgPicture.asset(
      "assets/custom_icons/received.svg",
      color: color,
      width: width,
    );
  }

  static Icon bank({Color? color, double? size}) {
    return Icon(
      Iconsax.bank,
      color: color,
      size: size,
    );
  }
}

class SocialCircleIcon extends StatelessWidget {
  final Icon icon;
  final Color? backgroundColor;
  final LinearGradient? backgroundGradient;
  final String title;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;

  const SocialCircleIcon({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.backgroundGradient,
    this.title = "",
    this.marginBottom = 6,
    this.marginLeft = 0,
    this.marginRight = 15,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor2;
    LinearGradient? backgroundGradient2;

    backgroundColor2 = backgroundColor;
    backgroundGradient2 = backgroundGradient;

    if (backgroundGradient != null) {
      backgroundColor2 = null;
    }

    if (backgroundColor != null) {
      backgroundGradient2 = null;
    }
    return Container(
      margin: EdgeInsets.only(
        bottom: marginBottom,
        left: marginLeft,
        right: marginRight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            margin: const EdgeInsets.only(
              bottom: 6,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor2,
              gradient: backgroundGradient2,
            ),
            child: icon,
          ),
          if (title != "")
            HeaderSubText(
              text: title,
            ),
        ],
      ),
    );
  }
}