import 'package:flutter/material.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/cards.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import 'package:solid_social/utils/assets/transactions.dart';

import '../routes.dart';

class SampleFinancesScreen extends StatelessWidget {
  const SampleFinancesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const HeadingText5(
          text: "Finances",
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: CustomIcons.allTransaction(),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline
            ),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: CustomColors.blue,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("assets/backgrounds/cards/card_overlay2.png"),
                  fit: BoxFit.fill,
                ),
              ),
              padding: const EdgeInsets.only(
                top: 25,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      InterText(
                        text: "Community Balance",
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const HeadingText(
                    text: "\$250,000.00",
                    color: Colors.white,
                  ),
                  TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF56CFE1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const InterText(
                      text: "Donate",
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomIcons.fundraiserHeart(),
                    const SizedBox(
                      width: 15,
                    ),
                    const HeadingText5(
                      text: "Fundraisers",
                    ),
                  ],
                ),
                TextButton(
                  onPressed: (){},
                  child: const InterText(
                    text: "See all",
                    color: CustomColors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FundraiserCard(
                  title: "Lagos Fashion Week 2022 Event planning",
                  imageAsset: "assets/sample_images/fashion-cover.png",
                  goal: "50,000",
                  raised: "25,000",
                  progress: 0.5,
                  onPressed: (){
                    Navigator.pushNamed(context, SampleAppRouter.fundraiserScreen);
                  },
                ),
                FundraiserCard(
                  title: "Donation to orphanage homes for good clothing",
                  imageAsset: "assets/sample_images/orphanage.png",
                  goal: "50,000",
                  raised: "25,000",
                  progress: 0.5,
                  onPressed: (){
                    Navigator.pushNamed(context, SampleAppRouter.fundraiserScreen);
                  },
                ),
                const SizedBox(
                  width: CustomGlobal.paddingInline,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline
            ),
            child: CustomOutlinedButtonIcon(
              onPressed: (){},
              verticalPadding: 20,
              borderRadius: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    color: CustomColors.blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InterText(
                    text: "Create Fundraiser",
                    color: CustomColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: CustomGlobal.paddingInline
            ),
            child: HeadingText5(
              text: "Recent Transactions",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline
            ),
            child: Column(
              children: [
                const RecentTransactionsItem(
                  imageAsset: "assets/sample_images/avatars/avatar2.png",
                  comment: "to Lagos Fashion Week 2022",
                  timeElapsed: "2mins",
                  username: "Tasboy",
                  donationAmount: "200",
                ),
                _divider(),
                const RecentTransactionsItem(
                  imageAsset: "assets/sample_images/avatars/avatar7.png",
                  comment: "to Lagos Fashion Week 2022",
                  timeElapsed: "2mins",
                  username: "Stephen Paul",
                  donationAmount: "500",
                ),
                _divider(),
                const RecentTransactionsItem(
                  imageAsset: "assets/sample_images/avatars/avatar2.png",
                  comment: "For Donation to orphanage homes ljsdalkf",
                  timeElapsed: "1h",
                  username: "Grace Barlow",
                  withdrawalAmount: "20,000",
                ),
                _divider(),
                const RecentTransactionsItem(
                  imageAsset: "assets/sample_images/avatars/avatar2.png",
                  comment: "For Donation to orphanage homes ljsdalkf",
                  timeElapsed: "1h",
                  username: "Grace Barlow",
                  withdrawalAmount: "20,000",
                ),
                _divider(),
                const RecentTransactionsItem(
                  imageAsset: "assets/sample_images/avatars/avatar7.png",
                  comment: "to Lagos Fashion Week 2022",
                  timeElapsed: "2mins",
                  username: "Stephen Paul",
                  donationAmount: "500",
                ),
                _divider(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _divider({double height = 25}) {
    return Divider(
      height: height,
      thickness: 0.5,
      color: CustomColors.grey25Black,
    );
  }
}

