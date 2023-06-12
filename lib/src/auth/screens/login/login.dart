// Dart imports:
import 'dart:developer';
import 'dart:io';

// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:solid_social/constants/auth_exception_messages.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/bootstrap/stream_chat_controller/stream_chat_controller.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:solid_social/src/auth/domain/services/notifiers/auth_state.dart';
import 'package:solid_social/src/auth/screens/signup/verification.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

//import 'package:google_fonts/google_fonts.dart';

String _welcomeTxt = 'Welcome Back!';
String _welcomeSubTxt = 'Enter your details to log in to Solid Social';
double _paddingInline = 20;
String _facebookBtnTxt = 'Continue with Facebook';
String _googleBtnTxt = 'Continue with Google';
String _appleBtnTxt = 'Continue with Apple';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leading: BackButton(
          onPressed: () => {context.off(AppRouter.welcome)},
        ),
      ),
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        final controller = context.read<AuthController>();
        controller.stateNotifier = (state) {
          state.when(
            logOut: () {
              log("LOGOUT");
            },
            loggedIn: (user) {
              context.read<AuthController>().solidSocialUser = user;
              context
                  .read<StreamChatController>()
                  .connectUser(userId: user.uid, firstName: user.firstName, lastName: user.lastName);
              context.toNamed(AppRouter.feed);
            },
            loggingIn: (t) {},
            noUser: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(kUserNotFoundAuthSnackbarMessage, style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.red,
              ));
            },
            error: (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text(e.message ?? kSomethingWentWrongExceptionMessage, style: const TextStyle(color: Colors.white)),
                backgroundColor: Colors.red,
              ));
            },
            none: () {},
            otpSent: (String phoneNumber, String verificationId) {
              final args = OtpVerificationArgs(phoneNumber: phoneNumber, verificationId: verificationId);
              context.toNamed(AppRouter.verification, arguments: args);
            },
          );
        };

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: _paddingInline, top: 50),
                color: Colors.white,
                child: HeadingText(
                  text: _welcomeTxt,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 10, left: _paddingInline),
                  child: HeaderSubText(
                    text: _welcomeSubTxt,
                  )),
              InputField(
                controller: _email,
                placeholder: 'Email',
                paddingLeft: _paddingInline,
                paddingRight: _paddingInline,
                paddingTop: 35,
              ),
              InputField(
                controller: _password,
                placeholder: 'Password',
                paddingLeft: _paddingInline,
                paddingRight: _paddingInline,
                paddingTop: 10,
                obscureText: true,
                maxLines: 1,
              ),
              Center(
                child: MainBtn(
                  color: CustomColors.blue,
                  text: 'Log in',
                  onPressed: () => {
                    controller.signInWithEmailAndPassword(_email.text, _password.text),
                    // Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false)
                  },
                  paddingTop: 20,
                  paddingLeft: _paddingInline,
                  paddingRight: _paddingInline,
                  width: 360,
                  textColor: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: const Center(
                  child: Text(
                    'Or',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: Builder(builder: (context) {
                  bool isLoading = false;
                  context.select((AuthController val) => val.state).maybeWhen(
                      loggingIn: (t) {
                        isLoading = t == AuthType.facebook;
                      },
                      orElse: () => isLoading = false);
                  return MainBtnSvg(
                    isLoading: isLoading,
                    onPressed: () => {controller.signInWithFacebook()},
                    text: _facebookBtnTxt,
                    svg: SvgPicture.asset('assets/logos/svg/facebook.svg'),
                    width: double.infinity,
                    paddingLeft: _paddingInline,
                    paddingRight: _paddingInline,
                    marginBottom: 20,
                  );
                }),
              ),
              Center(
                child: Builder(builder: (context) {
                  bool isLoading = false;
                  context.select((AuthController val) => val.state).maybeWhen(
                      loggingIn: (t) {
                        isLoading = t == AuthType.google;
                      },
                      orElse: () => isLoading = false);
                  return MainBtnSvg(
                    isLoading: isLoading,
                    onPressed: () async {
                      await context.read<AuthController>().signInWithGoogle();
                    },
                    text: _googleBtnTxt,
                    svg: SvgPicture.asset('assets/logos/svg/google.svg'),
                    width: double.infinity,
                    paddingLeft: _paddingInline,
                    paddingRight: _paddingInline,
                    marginBottom: 20,
                  );
                }),
              ),
              if (Platform.isIOS)
                Center(
                  child: Builder(builder: (context) {
                    bool isLoading = false;
                    context.select((AuthController val) => val.state).maybeWhen(
                        loggingIn: (t) {
                          isLoading = t == AuthType.apple;
                        },
                        orElse: () => isLoading = false);
                    return MainBtnSvg(
                      isLoading: isLoading,
                      onPressed: () => {
                        // Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false),
                      },
                      text: _appleBtnTxt,
                      svg: SvgPicture.asset('assets/logos/svg/apple.svg'),
                      width: double.infinity,
                      marginLeft: _paddingInline,
                      marginRight: _paddingInline,
                    );
                  }),
                ),
              Container(
                margin: EdgeInsets.only(left: _paddingInline, top: 35),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                          text: "Sign Up",
                          style: const TextStyle(
                            color: CustomColors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              Navigator.pushNamed(context, '/signup');
                            }),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: _paddingInline, top: 30, bottom: 100),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Forgot Password?",
                        style: const TextStyle(
                          color: CustomColors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            Navigator.pushNamed(context, '/login/forgotPassword');
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
