import 'package:flutter/material.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const HeadingText5(
          text: "View Product",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomIcons.shoppingCart(),
          ),
        ],
      ),
      body: const Center(
        child: HeadingText(
          text: "View Product Screen",
        ),
      ),
    );
  }
}
