import 'package:flutter/material.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class FundraiserScreen extends StatefulWidget {
  const FundraiserScreen({Key? key}) : super(key: key);

  @override
  State<FundraiserScreen> createState() => _FundraiserScreenState();
}

class _FundraiserScreenState extends State<FundraiserScreen> {
  int maxLines = 5;
  bool linesAreExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: const HeadingText5(
            text: "Fundraiser",
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                onPressed: () {},
                icon: CustomIcons.share2(color: Colors.black),
              ),
            ),
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(
                "assets/sample_images/fashion-cover.png",
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CustomGlobal.paddingInline,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: HeadingText5(
                      text: "Lagos Fashion Week 2022 Event planning",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  CustomOutlinedButton(
                    onPressed: () {},
                    text: "Edit",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
              child: LinearProgressIndicator(
                color: CustomColors.blue,
                backgroundColor: CustomColors.grey25Black,
                value: 0.5,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
              child: Row(
                children: [
                  CustomIcons.money(size: 30),
                  const SizedBox(
                    width: 15,
                  ),
                  const InterText(
                    text: "\$24,000 Raised ",
                  ),
                  const InterText(
                    text: "of \$50,000 goal",
                    color: CustomColors.grey75,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CustomGlobal.paddingInline,
                vertical: 10,
              ),
              child: Row(
                children: [
                  CustomIcons.heartPerson(width: 30),
                  const SizedBox(
                    width: 15,
                  ),
                  const InterText(
                    text: "50 Donors",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MainBtnIcon(
              onPressed: () {},
              paddingLeft: CustomGlobal.paddingInline,
              paddingRight: CustomGlobal.paddingInline,
              color: const Color(0xFF56CFE1),
              icon: CustomIcons.strongBox_bold(
                color: const Color(0xFF292D32),
              ),
              text: "End Fundraiser",
              elevation: 0,
            ),
            MainBtn(
              text: "Donate Now",
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.donate);
              },
              paddingLeft: CustomGlobal.paddingInline,
              paddingRight: CustomGlobal.paddingInline,
              color: CustomColors.blue,
              textColor: Colors.white,
              elevation: 0,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
              child: Row(
                children: const [
                  ProfilePictureImage(
                    asset: "assets/sample_images/avatars/avatar2.png",
                    width: 45,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InterText(
                    text: "Fundraiser organized by ",
                    color: CustomColors.grey75,
                  ),
                  InterText(
                    text: "Stephen Paul",
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: CustomGlobal.paddingInline,
                right: CustomGlobal.paddingInline,
                top: 15,
                bottom: 5,
              ),
              child: InterText(
                text:
                    "This fundraiser is for the purpose of proper planning of the forthcoming Lagos Fashion Week. To package the even in such a way that the experience will remain evergreen in every attendee’s memory. We are trying to create a one in town event the will always interest people naturally without having to promote it in years to come. This fundraiser is for the purpose of proper planning of the forthcoming Lagos Fashion Week. To package the even in such a way that the experience will remain evergreen in every attendee’s memory. We are trying to create a one in town event the will always interest people naturally without having to promote it in years to come",
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CustomGlobal.paddingInline,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (linesAreExpanded) {
                      maxLines = 5;
                      linesAreExpanded = false;
                    } else {
                      maxLines = 50;
                      linesAreExpanded = true;
                    }
                  });
                },
                child: const InterText(
                  text: "Read more",
                  color: CustomColors.blue,
                ),
              ),
            ),
          ],
        ));
  }
}
