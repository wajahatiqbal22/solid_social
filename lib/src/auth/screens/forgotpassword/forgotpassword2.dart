// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import '../../../../utils/assets/buttons.dart';

double _paddingInline = 20;
double _inputWidth = 60;

class ForgotPasswordScreen2 extends StatelessWidget {
  const ForgotPasswordScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leading: BackButton(
          onPressed: () => {
            Navigator.pushNamed(context, '/login'),
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
              text: 'Forgot Password?',
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 30,
              left: _paddingInline,
              right: 100,
            ),
            color: Colors.white,
            child: const HeaderSubText(
              text: 'A five digit OTP has been sent to the email address you submitted!, Enter OTP to continue.',
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: _paddingInline, right: _paddingInline, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InputField(
                      placeholder: '',
                      width: _inputWidth,
                      limit: 1,
                    ),
                  ],
                ),
                Column(
                  children: [
                    InputField(
                      placeholder: '',
                      width: _inputWidth,
                      limit: 1,
                    ),
                  ],
                ),
                Column(
                  children: [
                    InputField(
                      placeholder: '',
                      width: _inputWidth,
                      limit: 1,
                    ),
                  ],
                ),
                Column(
                  children: [
                    InputField(
                      placeholder: '',
                      width: _inputWidth,
                      limit: 1,
                    ),
                  ],
                ),
                Column(
                  children: [
                    InputField(
                      placeholder: '',
                      width: _inputWidth,
                      limit: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: MainBtn(
                text: 'Continue',
                width: double.infinity,
                paddingRight: _paddingInline,
                paddingLeft: _paddingInline,
                height: 60,
                color: const Color(0xFF0085FF),
                textColor: Colors.white,
                onPressed: () => {
                  Navigator.pushNamed(context, '/login/forgotPassword3'),
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: _paddingInline,
              top: 20,
              bottom: 80,
            ),
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
                      color: Color(0xFF0085FF),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () async {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
