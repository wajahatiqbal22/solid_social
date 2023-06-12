// Flutter imports:
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';

// Project imports:
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/collapsables.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class WalletSettingsScreen extends StatelessWidget {
  const WalletSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const HeadingText5(
          text: "Wallet",
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: CustomGlobal.paddingInline / 2),
            child: CustomIcons.settings(color: Colors.black),
          ),
        ],
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomGlobal.paddingInline),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    InterText(
                      text: "Available Balance",
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    HeadingText(
                      text: "\$250,000.00",
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomGlobal.paddingInline),
              child: Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButtonIcon(
                      onPressed: () {},
                      verticalPadding: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcons.importBold(),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Fund",
                            style: TextStyle(
                                color: CustomColors.blue,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomOutlinedButtonIcon(
                      onPressed: () {},
                      verticalPadding: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcons.exportBold(),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Withdraw",
                            style: TextStyle(
                                color: CustomColors.blue,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TabBar(
              labelStyle: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.headline5,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              labelColor: CustomColors.blue,
              unselectedLabelColor: CustomColors.grey75,
              tabs: const [
                Tab(
                  text: "Tokens",
                ),
                Tab(
                  text: "Cash",
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 500,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
                child: const TabBarView(
                  children: <Widget>[
                    TokenTab(),
                    CashTab(),
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TokenTab extends StatelessWidget {
  const TokenTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: CustomColors.blue50
          ),
          constraints: const BoxConstraints(
            minHeight: 75,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: CustomGlobal.paddingInline,
              right: 5
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ProfilePictureImage(
                      asset: "assets/logos/srt-image-512.png",
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        InterText(
                          text: "SRT",
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        InterText(
                          text: "\$332.68",
                          color: CustomColors.grey75,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        InterText(
                          text: "0.0002 SRT",
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        InterText(
                          text: "\$3.97",
                          color: CustomColors.grey75,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: CustomIcons.postOptionsVertical(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        CollapsableWithText(
          title: "Reward",
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline / 2
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      child: CalendarWidget(
                        text: "Today",
                      ),
                    ),
                  ],
                ),
                const InterText(
                  text: "Today Estimated",
                ),
                const SizedBox(
                  height: 10,
                ),
                const HeadingText5(
                  text: "0",
                ),
                const SizedBox(
                  height: 15,
                ),
                const InterText(
                  text: "Next Payout",
                ),
                const SizedBox(
                  height: 10,
                ),
                const HeadingText5(
                  text: "7h",
                ),
                const SizedBox(
                  height: 15,
                ),
                const InterText(
                  text: "All-time rewards",
                ),
                const SizedBox(
                  height: 10,
                ),
                const HeadingText5(
                  text: "0",
                ),
                const Divider(
                  color: CustomColors.grey25Black,
                  thickness: 0.5,
                  height: 40,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: InterText(
                        text: "Total",
                      ),
                    ),
                    InterText(
                      text: "\$0",
                    ),
                  ],
                ),
                const Divider(
                  color: CustomColors.grey25Black,
                  height: 40,
                  thickness: 0.5,
                ),
                const WalletDetailsItem(
                  text: "Engagements",
                ),
                const WalletDetailsItem(
                  text: "Holdings",
                ),
                const WalletDetailsItem(
                  text: "Liquidity",
                )
              ],
            ),
          ),
        ),
        CollapsableWithText(
          title: "Earnings",
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline / 2
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      child: CalendarWidget(
                        text: "August 2022",
                      ),
                    ),
                  ],
                ),
                const WalletDetailsItem(
                  text: "Total",
                  amount: 10,
                ),
                const WalletDetailsItem(
                  text: "Revenue Share",
                ),
                const WalletDetailsItem(
                  text: "Solidsocial Pay",
                )
              ],
            ),
          ),
        ),
        const CollapsableWithText(
          title: "Balance",
        ),
        CollapsableWithText(
          title: "Transactions",
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomGlobal.paddingInline / 2
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      child: CalendarWidget(
                        text: 'All',
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 15
                  ),
                  child: InterText(
                    text: "Today",
                    color: CustomColors.grey75,
                  ),
                ),
                const TransactionItem(
                  amount: 4000,
                  isWithdraw: true,
                  user: "You",
                  message: "August Cash Out",
                  time: "2 mins",
                ),
                const TransactionItem(
                  amount: 5000,
                  isWithdraw: false,
                  user: "You",
                  time: "6 mins",
                ),
                const TransactionItem(
                  amount: 2500,
                  isWithdraw: false,
                  user: "You",
                  time: "30 mins",
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      bottom: 15
                  ),
                  child: InterText(
                    text: "08-07-2022",
                    color: CustomColors.grey75,
                  ),
                ),
                const TransactionItem(
                  user: "You",
                  isWithdraw: true,
                  amount: 2000,
                  time: "2 days",
                  message: "July Cashout Thank God",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CashTab extends StatelessWidget {
  const CashTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: CustomColors.blue50
          ),
          padding: const EdgeInsets.symmetric(
            vertical: CustomGlobal.paddingInline / 2,
            horizontal: CustomGlobal.paddingInline,
          ),
          width: double.infinity,
          child: Column(
            children: [
              Material(
                elevation: 2,
                shadowColor: Colors.black.withOpacity(0.5),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: (){},
                  borderRadius: BorderRadius.circular(8),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: const Border.fromBorderSide(
                        BorderSide(
                          color: CustomColors.grey25Black,
                          width: 0.5,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        CustomIcons.bank(
                          color: CustomColors.blue
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              InterText(
                                text: "Add Bank",
                                color: CustomColors.blue,
                                fontWeight: FontWeight.w700,
                              ),
                              InterText(
                                text: "Add bank to start receiving cash payouts",
                                fontSize: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        InterText(
                          text: "Pending Transfers",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HeadingText(
                          text: "\$1055",
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        InterText(
                          text: "Pending Transfers",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HeadingText(
                          text: "\$1055",
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        CollapsableWithText(
          title: "Earnings",
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: CustomGlobal.paddingInline / 2
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      child: CalendarWidget(
                        text: "August 2022",
                      ),
                    ),
                  ],
                ),
                const WalletDetailsItem(
                  text: "Total",
                  amount: 10,
                ),
                const WalletDetailsItem(
                  text: "Revenue Share",
                ),
                const WalletDetailsItem(
                  text: "Solidsocial Pay",
                )
              ],
            ),
          ),
        ),
        CollapsableWithText(
          title: "Transactions",
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: CustomGlobal.paddingInline / 2
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      child: CalendarWidget(
                        text: 'All',
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      bottom: 15
                  ),
                  child: InterText(
                    text: "Today",
                    color: CustomColors.grey75,
                  ),
                ),
                const TransactionItem(
                  amount: 4000,
                  isWithdraw: true,
                  user: "You",
                  message: "August Cash Out",
                  time: "2 mins",
                ),
                const TransactionItem(
                  amount: 5000,
                  isWithdraw: false,
                  user: "You",
                  time: "6 mins",
                ),
                const TransactionItem(
                  amount: 2500,
                  isWithdraw: false,
                  user: "You",
                  time: "30 mins",
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      bottom: 15
                  ),
                  child: InterText(
                    text: "08-07-2022",
                    color: CustomColors.grey75,
                  ),
                ),
                const TransactionItem(
                  user: "You",
                  isWithdraw: true,
                  amount: 2000,
                  time: "2 days",
                  message: "July Cashout Thank God",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final String text;

  const CalendarWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: const Border.fromBorderSide(
            BorderSide(
                color: CustomColors.grey25Black,
                width: 0.5
            )
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 15
            ),
            child: InterText(
              text: text,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: CustomIcons.calendar,
          ),
        ],
      ),
    );
  }
}

class WalletDetailsItem extends StatelessWidget {
  final String text;
  final double amount;

  const WalletDetailsItem({
    Key? key,
    required this.text,
    this.amount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InterText(
            text: text,
          ),
        ),
        InterText(
          text: "\$${amount.toStringAsFixed(2)}",
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: CustomIcons.arrowDown(
              width: 15
          ),
          onPressed: (){},
        )
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final double amount;
  final bool isWithdraw;
  final String user;
  final String? message;
  final String time;

  const TransactionItem({
    Key? key,
    required this.user,
    required this.amount,
    required this.isWithdraw,
    this.message,
    this.time = "0min",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.blue50
                  ),
                  child: Center(
                    child: isWithdraw ? CustomIcons.send() : CustomIcons.receive(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        InterText(
                          text: user,
                          fontSize: 10,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InterText(
                          text: isWithdraw ? "withdrew $time ago" : "funded $time ago",
                          color: CustomColors.grey75,
                          fontSize: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    if(message != null)
                      InterText(
                        text: message!,
                      ),
                  ],
                )
              ],
            ),
            InterText(
              text: "\$${amount.toStringAsFixed(2)}",
              color: isWithdraw ? Colors.red : Colors.green,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ],
        ),
        const Divider(
          height: 30,
          color: CustomColors.grey25Black,
          thickness: 0.5,
        ),
      ],
    );
  }
}
