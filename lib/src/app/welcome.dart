// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import '../../utils/assets/colors.dart';

var _welcomeMsg = 'Welcome to SolidSocial';
var _welcomeSubtxt = 'Sign up to start using our services, or Login if you already have an account';
const _mainWidth = 350.00;

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('${ModalRoute.of(context)?.settings.name}');

    return Scaffold(
      backgroundColor: CustomColors.blue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/logos/signup/whitelogo2.png', width: 150),
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              _welcomeMsg,
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              _welcomeSubtxt,
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 12,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            MainBtn(
              color: Colors.white,
              text: 'Sign up',
              width: _mainWidth,
              bottomMargin: 20,
              textColor: CustomColors.blue,
              onPressed: () => {context.off(AppRouter.signUp)},
              elevation: 0,
            ),
            MainBtn(
              color: Colors.transparent,
              text: 'Log in',
              textColor: Colors.white,
              bottomMargin: 50,
              onPressed: () => {context.off(AppRouter.login)},
              elevation: 0,
              side: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
