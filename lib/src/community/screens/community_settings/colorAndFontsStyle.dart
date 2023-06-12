// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class ColorAndFontsStyleScreen extends StatefulWidget {
  const ColorAndFontsStyleScreen({Key? key}) : super(key: key);

  @override
  State<ColorAndFontsStyleScreen> createState() => _ColorAndFontsStyleScreenState();
}

class _ColorAndFontsStyleScreenState extends State<ColorAndFontsStyleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const HeadingText3(
            text: "Color and Fonts Style",
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: CustomGlobal.paddingTop),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InterText(
                    text: "Choose theme colour",
                    fontWeight: FontWeight.w600,
                    color: CustomColors.grey75,
                    padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 22,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                    children: [
                      Container(
                        decoration: BoxDecoration(color: CustomColors.blue, borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        decoration:
                            BoxDecoration(color: const Color(0xFF56CFE1), borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        decoration:
                            BoxDecoration(color: const Color(0xFF25B03B), borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        decoration:
                            BoxDecoration(color: const Color(0xFFFF7A00), borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        decoration:
                            BoxDecoration(color: const Color(0xFFE34949), borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        decoration:
                            BoxDecoration(color: const Color(0xFF874E4E), borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        decoration:
                            BoxDecoration(color: const Color(0xFFFF6FC5), borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        decoration:
                            BoxDecoration(color: const Color(0xFFA93DFF), borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 50,
                    thickness: 0.5,
                    color: CustomColors.grey25Black,
                  ),
                  const InterText(
                    text: "Choose font style",
                    padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                    color: CustomColors.grey75,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                    child: Column(
                      children: [
                        _fontStyle(
                          const InterText(
                            text: "Inter",
                            fontSize: 16,
                          ),
                          isChecked: false,
                        ),
                        _fontStyle(
                          const TimesNewRomanText(
                            text: "Times New Roman",
                            fontSize: 16,
                          ),
                        ),
                        _fontStyle(
                          const BebasNeueText(
                            text: "Bebas Neue",
                            fontSize: 16,
                          ),
                        ),
                        _fontStyle(
                          const SpaceGrostekText(
                            text: "Space Grostek",
                            fontSize: 16,
                          ),
                        ),
                        _fontStyle(
                          const RobotoSlabText(
                            text: "Roboto Slab",
                            fontSize: 16,
                          ),
                        ),
                        _fontStyle(
                          const PacificoText(
                            text: "Pacifico",
                            fontSize: 16,
                          ),
                        ),
                        _fontStyle(
                          const CairoText(
                            text: "Cairo",
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: CustomGlobal.marginBottomButtons),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MainBtn(
                  text: 'Save Changes',
                  onPressed: () {},
                  color: CustomColors.blue,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }

  /// TODO:
  /// - fix isChecked (is inverted)
  Padding _fontStyle(Widget fontStyle, {bool isChecked = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          fontStyle,
          SizedBox(
            height: 15,
            width: 15,
            child: CustomRadioButton(isChecked: isChecked),
          ),
        ],
      ),
    );
  }
}
