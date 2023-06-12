// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/cards.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 20),
          child: InputField(
            placeholder: "Search courses",
            prefixIcon: CustomIcons.search(color: CustomColors.grey75, width: 16),
            contentPadding: 8,
            enableBorder: false,
            placeholderSize: 10,
            isDense: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: CustomGlobal.paddingInline, bottom: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: HeadingText5(
              text: "Popular Courses",
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: CustomGlobal.paddingInline,
                ),
                CourseCard(
                  imageAsset: "assets/sample_images/binance.jpeg",
                  title: "The art of Fashion",
                  instructor: "Stephen Paul",
                  price: 50.00,
                  onPressed: () {},
                ),
                CourseCard(
                  imageAsset: "assets/sample_images/clothes.png",
                  title: "Men's Style",
                  instructor: "Stephen Paul",
                  price: 40,
                  onPressed: () {},
                ),
                CourseCard(
                  imageAsset: "assets/sample_images/binance.jpeg",
                  title: "The art of Fashion",
                  instructor: "Stephen Paul",
                  price: 50.00,
                  onPressed: () {},
                ),
                CourseCard(
                  imageAsset: "assets/sample_images/clothes.png",
                  title: "Men's Style",
                  instructor: "Stephen Paul",
                  price: 40,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: CustomColors.grey25Black,
          thickness: 0.5,
          height: 60,
        ),
        const Padding(
          padding: EdgeInsets.only(left: CustomGlobal.paddingInline, bottom: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: HeadingText5(
              text: "All Courses",
            ),
          ),
        ),
        GridView(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline / 2),
          children: [
            CourseCard(
              imageAsset: "assets/sample_images/clothes.png",
              title: "Men's Style",
              instructor: "Stephen Paul",
              price: 40,
              onPressed: () {},
            ),
            CourseCard(
              imageAsset: "assets/sample_images/clothes.png",
              title: "Men's Style",
              instructor: "Stephen Paul",
              price: 40,
              onPressed: () {},
            ),
            CourseCard(
              imageAsset: "assets/sample_images/clothes.png",
              title: "Men's Style",
              instructor: "Stephen Paul",
              price: 40,
              onPressed: () {},
            ),
            CourseCard(
              imageAsset: "assets/sample_images/clothes.png",
              title: "Men's Style",
              instructor: "Stephen Paul",
              price: 40,
              onPressed: () {},
            ),
            CourseCard(
              imageAsset: "assets/sample_images/clothes.png",
              title: "Men's Style",
              instructor: "Stephen Paul",
              price: 40,
              onPressed: () {},
            ),
            CourseCard(
              imageAsset: "assets/sample_images/clothes.png",
              title: "Men's Style",
              instructor: "Stephen Paul",
              price: 40,
              onPressed: () {},
            ),
            CourseCard(
              imageAsset: "assets/sample_images/clothes.png",
              title: "Men's Style",
              instructor: "Stephen Paul",
              price: 40,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
