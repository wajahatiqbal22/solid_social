// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

double _paddingInline = 20;
double _inputWidth = 60;

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key, required this.args}) : super(key: key);

  final OtpVerificationArgs args;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<String> otp = ["_", "_", "_", "_", "_", "_"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leading: BackButton(
          onPressed: () => {
            Navigator.pushNamed(context, '/signup'),
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: _paddingInline, top: 50),
            color: Colors.white,
            child: const HeadingText(
              text: 'Verification',
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: _paddingInline),
            child: const HeaderSubText(
              text: 'Enter 6 digit verification code sent to your e-mail',
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, left: _paddingInline),
            child: Text(
              widget.args.phoneNumber,
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.headline4,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: _paddingInline, right: _paddingInline, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: OtpInput(
                      backAutoFocus: index != 0,
                      frontAutoFocus: index != 5,
                      onChanged: (val) {
                        setState(() {
                          if (val.isEmpty) {
                            otp[index] = "_";
                          } else {
                            otp[index] = val;
                          }
                        });
                      },
                      placeholder: '',
                      width: _inputWidth,
                      limit: 1,
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: MainBtn(
                text: 'Verify',
                width: double.infinity,
                paddingLeft: _paddingInline,
                paddingRight: _paddingInline,
                height: 60,
                color: CustomColors.blue,
                textColor: Colors.white,
                onPressed: otp.contains("_")
                    ? null
                    : () {
                        context
                            .read<AuthController>()
                            .verifyOtp(widget.args.verificationId, otp.join(), isLinking: widget.args.isLinking);
                      },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: _paddingInline, top: 35),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Didn't get code? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: "Resend",
                    style: const TextStyle(
                      color: CustomColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        print('Hello');
                      },
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25, left: _paddingInline, bottom: 60),
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
                      color: CustomColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        Navigator.pushNamed(context, '/login');
                      },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OtpVerificationArgs {
  final String phoneNumber;
  final String verificationId;
  final bool isLinking;
  final SolidSocialUser? user;

  OtpVerificationArgs({required this.phoneNumber, required this.verificationId, this.isLinking = false, this.user});
}
