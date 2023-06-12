// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/assets/textstyles.dart';
import '../../../../utils/assets/buttons.dart';
import '../../../../utils/assets/formFields.dart';

const double _paddingInline = 20;

class ForgotPasswordScreen3 extends StatelessWidget {
  const ForgotPasswordScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
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
            padding: const EdgeInsets.only(
              left: _paddingInline,
              top: 50,
            ),
            color: Colors.white,
            child: const HeadingText(
              text: 'Enter your new password',
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: _paddingInline,
              top: 50,
              right: _paddingInline,
            ),
            child: const InputField(
              placeholder: 'New Password',
              width: double.infinity,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: _paddingInline,
              right: _paddingInline,
              top: 30,
            ),
            child: const InputField(
              placeholder: 'Confirm New Password',
              width: double.infinity,
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: MainBtn(
                text: 'Done',
                width: double.infinity,
                paddingRight: _paddingInline,
                paddingLeft: _paddingInline,
                paddingBottom: 60,
                height: 60,
                color: const Color(0xFF0085FF),
                textColor: Colors.white,
                onPressed: () => {
                  Navigator.pushNamed(context, '/login'),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
