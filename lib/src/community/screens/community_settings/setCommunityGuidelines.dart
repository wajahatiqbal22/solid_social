// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class SetCommunityGuidelinesScreen extends StatelessWidget {
  const SetCommunityGuidelinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText3(
          text: "Edit community guidelines",
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: CustomGlobal.paddingTop, left: CustomGlobal.paddingInline, right: CustomGlobal.paddingInline),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InterText(text: "Edit words that are not allowed in the community"),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  minLines: 7,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    hintText: "Add words here",
                    hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12),
                    filled: true,
                    fillColor: CustomColors.blue50,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFD3DCE4), width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: CustomColors.blue, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const InterText(
                  text: "Separate words or phrases with comma",
                  color: CustomColors.grey75,
                  fontSize: 12,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InterText(
                      text: "Enable unallowed list",
                    ),
                    CustomFlutterSwitch(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: CustomColors.grey25Black,
                  thickness: 0.5,
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: CustomDropdownButton<String>(
                    items: [
                      //TODO: Implement
                      // "Chat guidelines",
                      // "Chat guidelines2",
                      // "Chat guidelines3",
                      // "Chat guidelines4",
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: CustomDropdownButton(
                    items: [
                      //TODO: Implement
                      // "Event guidelines",
                      // "Event guidelines2",
                      // "Event guidelines3",
                      // "Event guidelines4",
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: CustomGlobal.paddingInline, vertical: CustomGlobal.marginBottomButtons),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MainBtn(
                onPressed: () {},
                text: "Save changes",
                color: CustomColors.blue,
                textColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
