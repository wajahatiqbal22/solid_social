import 'package:flutter/material.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class RecentTransactionsItem extends StatelessWidget {
  final String imageAsset;
  final String username;
  final String timeElapsed;
  final String comment;
  final String? withdrawalAmount;
  final String? donationAmount;

  const RecentTransactionsItem({
    super.key,
    required this.imageAsset,
    required this.username,
    required this.timeElapsed,
    required this.comment,
    this.withdrawalAmount,
    this.donationAmount,
  }) : assert((withdrawalAmount != null && donationAmount == null) ||
            (donationAmount != null && withdrawalAmount == null));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePictureImage(
                asset: imageAsset,
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InterText(
                          text: username,
                        ),
                        const SizedBox(width: 10),
                        InterText(
                          text:
                              "${donationAmount != null ? "Donated" : (withdrawalAmount != null ? "Withdrew" : "")} $timeElapsed",
                          color: CustomColors.grey75,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InterText(
                      text: comment,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        InterText(
          text: "\$${donationAmount ?? (withdrawalAmount ?? "0")}",
          fontWeight: FontWeight.w700,
          color: donationAmount != null
              ? Colors.green
              : withdrawalAmount != null
                  ? Colors.red
                  : Colors.black,
        ),
      ],
    );
  }
}
