// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/extensions/string_extension.dart';
import 'package:solid_social/utils/assets/colors.dart';

class ProfilePictureImage extends StatelessWidget {
  final String? asset;
  final bool notification;
  final double width;
  final double height;
  final BoxFit fit;
  final BoxDecoration decoration;
  final bool enableLink;
  const ProfilePictureImage({
    super.key,
    this.asset,
    this.notification = false,
    this.width = 0,
    this.height = 0,
    this.fit = BoxFit.contain,
    this.decoration = const BoxDecoration(),
    this.enableLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (enableLink) {
          Navigator.pushNamed(context, '/profilePage');
        }
      },
      child: Stack(
        children: [
          Container(
            decoration: decoration,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300.0),
              child: asset == null
                  ? Container(color: Colors.blueGrey)
                  : !asset!.isURL
                      ? Image.asset(
                          asset!,
                          width: width > 0 ? width : null,
                          height: height > 0 ? height : null,
                          fit: fit,
                        )
                      : Image.network(
                          asset!,
                          width: width > 0 ? width : null,
                          height: height > 0 ? height : null,
                          fit: fit,
                        ),
            ),
          ),
          if (notification)
            Positioned(
              right: 5,
              top: 7,
              child: SvgPicture.asset(
                'assets/custom_icons/floatingNotification.svg',
              ),
            ),
        ],
      ),
    );
  }
}

class ProfilePictureImage2 extends StatelessWidget {
  final String imageAsset;
  final double size;
  final BoxDecoration decoration;

  const ProfilePictureImage2({
    super.key,
    required this.imageAsset,
    required this.size,
    this.decoration = const BoxDecoration(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: decoration,
      child: CircleAvatar(
        backgroundImage: AssetImage(imageAsset),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class CircularNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final BoxDecoration decoration;

  const CircularNetworkImage({
    super.key,
    required this.imageUrl,
    this.size = 25,
    this.decoration = const BoxDecoration(),
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: imageUrl == null ? null : NetworkImage(imageUrl!),
      backgroundColor: Colors.blueGrey,
      radius: size,
    );
  }
}

class CircularNameInitials extends StatelessWidget {
  const CircularNameInitials(
      {super.key, required this.name, this.radius = 25, this.fontSize = 12, this.backgroundColor, this.textColor});

  final String name;
  final double radius;
  final double fontSize;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor ?? CustomColors.blue,
      radius: radius,
      child: Builder(
        builder: (context) {
          return Center(
            child: Text(
              name.initals,
              style: context.textTheme.headline6
                  ?.copyWith(color: textColor ?? Colors.white, fontWeight: FontWeight.w500, fontSize: fontSize),
            ),
          );
        },
      ),
    );
  }
}

class ImageStack extends StatelessWidget {
  final String imageAsset1;
  final String imageAsset2;
  final String imageAsset3;

  const ImageStack({
    super.key,
    required this.imageAsset1,
    required this.imageAsset2,
    required this.imageAsset3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfilePictureImage2(
          imageAsset: imageAsset1,
          size: 23,
          decoration: BoxDecoration(
            border: const Border.fromBorderSide(
              BorderSide(color: Colors.white, width: 1),
            ),
            borderRadius: BorderRadius.circular(300.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 23 / 2),
          child: ProfilePictureImage2(
            imageAsset: imageAsset2,
            size: 23,
            decoration: BoxDecoration(
              border: const Border.fromBorderSide(BorderSide(color: Colors.white, width: 1)),
              borderRadius: BorderRadius.circular(300.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: (23 / 3) * 3),
          child: ProfilePictureImage2(
            imageAsset: imageAsset3,
            size: 23,
            decoration: BoxDecoration(
              border: const Border.fromBorderSide(BorderSide(
                color: Colors.white,
                width: 1,
              )),
              borderRadius: BorderRadius.circular(300.0),
            ),
          ),
        )
      ],
    );
  }
}
