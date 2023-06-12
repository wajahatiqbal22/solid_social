// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import '../../../../utils/assets/buttons.dart';

double _paddingInline = 20;

class ForgotPasswordScreen1 extends StatelessWidget {
  const ForgotPasswordScreen1({Key? key}) : super(key: key);

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
              right: 150,
            ),
            color: Colors.white,
            child: const HeaderSubText(
              text: 'Enter the phone number or email address you registered with in the text field below',
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: _paddingInline,
              top: 50,
              right: _paddingInline,
            ),
            child: const InputField(
              placeholder: 'Email Address or Phone Number',
              width: double.infinity,
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: MainBtn(
                text: 'Get OTP',
                width: double.infinity,
                paddingRight: _paddingInline,
                paddingLeft: _paddingInline,
                paddingBottom: 60,
                height: 60,
                color: const Color(0xFF0085FF),
                textColor: Colors.white,
                onPressed: () => {
                  Navigator.pushNamed(context, '/login/forgotPassword2'),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
