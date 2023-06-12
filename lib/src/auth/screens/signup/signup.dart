// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/constants/auth_exception_messages.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/bootstrap/stream_chat_controller/stream_chat_controller.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/auth/domain/services/notifiers/auth_state.dart';
import 'package:solid_social/src/auth/screens/signup/verification.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

//import 'package:google_fonts/google_fonts.dart';

double _paddingInline = 20;
String _headerText = 'Create Account';
String _headerSubText = 'Enter your details to sign up on Solid Social';
double _inputSpacing = 15;
String _appleBtnTxt = 'Continue with Apple';
String _googleBtnTxt = 'Continue with Google';
String _facebookBtnTxt = 'Continue with Facebook';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final controller = context.read<AuthController>();
      controller.stateNotifier = (state) {
        state.when(
          logOut: () {},
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
              content: Text(e.message ?? "There was an error signing in. Try again!",
                  style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.red,
            ));
          },
          otpSent: (String phoneNumber, String verificationId) {
            final SolidSocialUser user =
                SolidSocialUser(firstName: _firstName.text, lastName: _lastName.text, email: _email.text, uid: "");
            context.toNamed(AppRouter.verification,
                arguments: OtpVerificationArgs(
                    phoneNumber: phoneNumber, verificationId: verificationId, isLinking: true, user: user));
          },
          none: () {},
        );
      };
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
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: _paddingInline, top: 50),
                  color: Colors.white,
                  child: HeadingText(
                    text: _headerText,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: _paddingInline),
                  child: HeaderSubText(
                    text: _headerSubText,
                  ),
                ),
                InputField(
                  validator: (p0) => p0!.isEmpty ? "This  field is mandatory." : null,
                  controller: _firstName,
                  placeholder: 'Firstname',
                  paddingLeft: _paddingInline,
                  paddingRight: _paddingInline,
                  paddingTop: 35,
                ),
                InputField(
                  validator: (p0) => p0!.isEmpty ? "This  field is mandatory." : null,
                  controller: _lastName,
                  placeholder: 'Lastname',
                  paddingLeft: _paddingInline,
                  paddingRight: _paddingInline,
                  paddingTop: _inputSpacing,
                ),
                InputField(
                  validator: (p0) => p0!.isEmpty ? "This  field is mandatory." : null,
                  controller: _email,
                  placeholder: 'Email',
                  paddingLeft: _paddingInline,
                  paddingRight: _paddingInline,
                  paddingTop: _inputSpacing,
                ),
                InputField(
                  validator: (p0) => p0!.isEmpty ? "This  field is mandatory." : null,
                  obscureText: true,
                  controller: _password,
                  placeholder: 'Password',
                  paddingLeft: _paddingInline,
                  paddingRight: _paddingInline,
                  paddingTop: _inputSpacing,
                ),
                InputField(
                  validator: (p0) => p0!.isEmpty ? "This  field is mandatory." : null,
                  controller: _phone,
                  placeholder: 'Phone Number',
                  paddingLeft: _paddingInline,
                  paddingRight: _paddingInline,
                  paddingTop: _inputSpacing,
                ),
                Center(
                  child: Builder(builder: (context) {
                    bool isLoading = false;
                    context.select((AuthController val) => val.state).maybeWhen(
                        loggingIn: (t) {
                          isLoading = t == AuthType.emailAndPassword;
                        },
                        orElse: () => isLoading = false);
                    return MainBtn(
                      isLoading: isLoading,
                      color: const Color(0xFF0085FF),
                      text: 'Sign up',
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          await controller.registerUser(_email.text, _password.text,
                              firstName: _firstName.text, lastName: _lastName.text, phoneNumber: _phone.text);
                        }
                        // Navigator.pushNamed(context, '/signup/verification'),
                      },
                      paddingTop: 20,
                      paddingRight: _paddingInline,
                      paddingLeft: _paddingInline,
                      width: 360,
                      textColor: Colors.white,
                    );
                  }),
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
                  child: MainBtnSvg(
                    onPressed: () => {
                      controller.signInWithFacebook(isFromSignup: true),
                      // Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false),
                    },
                    text: _facebookBtnTxt,
                    svg: SvgPicture.asset('assets/logos/svg/facebook.svg'),
                    width: double.infinity,
                    paddingLeft: _paddingInline,
                    paddingRight: _paddingInline,
                    marginBottom: 20,
                  ),
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
                        await context.read<AuthController>().signInWithGoogle(isFromSignup: true);
                        // Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false),
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
                    child: MainBtnSvg(
                      onPressed: () => {
                        Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false),
                      },
                      text: _appleBtnTxt,
                      svg: SvgPicture.asset('assets/logos/svg/apple.svg'),
                      width: double.infinity,
                      marginLeft: _paddingInline,
                      marginRight: _paddingInline,
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(left: _paddingInline, top: 35),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                            text: "Log in",
                            style: const TextStyle(
                              color: Color(0xFF0085FF),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                Navigator.pushNamed(context, '/login');
                              }),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: _paddingInline, top: 30, bottom: 100),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFF0085FF),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
