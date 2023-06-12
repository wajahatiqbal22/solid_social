import 'package:flutter/material.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/cards.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  final double _categoryHorizontalSpacing = 20;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: InputField(
                  placeholder: "Search store",
                  prefixIcon: CustomIcons.search(color: CustomColors.grey75, width: 16),
                  contentPadding: 8,
                  enableBorder: false,
                  placeholderSize: 10,
                  isDense: true,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              CustomOutlinedButton(
                onPressed: () {},
                text: "Sell",
                fontSize: 12,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: CustomGlobal.paddingInline),
          child: HeadingText5(text: "Available Categories"),
        ),
        const SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: CustomGlobal.paddingInline,
                ),
                const ShopCategoryCard(
                  title: "Men's Fashion",
                  asset: "assets/sample_images/shop-category1.png",
                ),
                SizedBox(
                  width: _categoryHorizontalSpacing,
                ),
                const ShopCategoryCard(
                  title: "Women's Fashion",
                  asset: "assets/sample_images/shop-category1.png",
                ),
                SizedBox(
                  width: _categoryHorizontalSpacing,
                ),
                const ShopCategoryCard(
                  title: "Women's Fashion",
                  asset: "assets/sample_images/shop-category1.png",
                ),
                SizedBox(
                  width: _categoryHorizontalSpacing,
                ),
                const ShopCategoryCard(
                  title: "Women's Fashion",
                  asset: "assets/sample_images/shop-category1.png",
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0.5,
          height: 60,
          color: CustomColors.grey25Black,
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: CustomGlobal.paddingInline,
          ),
          child: HeadingText5(
            text: "All Items",
          ),
        ),
        const SizedBox(
          height: 25,
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
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.viewProduct);
              },
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

class ShopScreenNoShop extends StatelessWidget {
  const ShopScreenNoShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 100,
        ),
        child: InterText(
          text: "No item available yet, come back another time to shop.",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
