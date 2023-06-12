// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

class BlurBackground extends StatelessWidget {
  const BlurBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            color: const Color(0xFF168A75),
          ),
        ),
        Positioned(
          top: 250,
          left: 150,
          child: Image.asset('assets/backgrounds/login_signup/ellipse4.png'),
        ),
        Positioned(
          top: 400,
          left: 100,
          child: Image.asset('assets/backgrounds/login_signup/ellipse3.png'),
        ),
        Positioned(
          left: 35,
          bottom: 250,
          child: Image.asset('assets/backgrounds/login_signup/ellipse2.png'),
        ),
        Positioned(
          bottom: 600,
          right: 100,
          child: Image.asset('assets/backgrounds/login_signup/ellipse1.png'),
        ),
        Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
