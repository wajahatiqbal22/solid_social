// Flutter imports:
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
// Project imports:
import 'package:solid_social/src/dummy/dummy_provider.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/icons.dart';

import '../../../utils/GLOBAL.dart';
import '../../../utils/assets/buttons.dart';
import '../../../utils/assets/colors.dart';
import '../../../utils/assets/textstyles.dart';

class AreaOfInterestCommunityScreen extends StatefulWidget {
  const AreaOfInterestCommunityScreen({Key? key, this.areaOfInterestArgs})
      : super(key: key);

  final AreaOfInterestArgs? areaOfInterestArgs;

  @override
  State<AreaOfInterestCommunityScreen> createState() =>
      _AreaOfInterestCommunityScreenState();
}

class _AreaOfInterestCommunityScreenState
    extends State<AreaOfInterestCommunityScreen> {
  List<String> interests = List.empty(growable: true);

  void addInterest(String interest) {
    interests.add(interest);
    setState(() {});
  }

  void removeInterest(String interest) {
    interests.remove(interest);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (widget.areaOfInterestArgs?.selectedInterests != null &&
        widget.areaOfInterestArgs!.selectedInterests!.isNotEmpty) {
      interests = widget.areaOfInterestArgs!.selectedInterests!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    List<Widget> categories = <Widget>[];
    const int limit = 7;
    int startIndex = 0;

    addToRow(List<Widget> categories) {
      rows.add(
        Padding(
          padding: const EdgeInsets.only(left: CustomGlobal.paddingInline),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: categories,
          ),
        ),
      );
    }

    for (int categoryIndex = startIndex;
        categoryIndex < DummyProvider.communityCategoryList.length;
        categoryIndex++) {
      categories.add(
        CustomGridButton(
          text: DummyProvider.communityCategoryList[categoryIndex]["text"],
          isFocused: interests.contains(
                  DummyProvider.communityCategoryList[categoryIndex]["text"])
              ? true
              : false,
          onPressed: () {
            if (interests.contains(
                DummyProvider.communityCategoryList[categoryIndex]['text'])) {
              removeInterest(
                  DummyProvider.communityCategoryList[categoryIndex]['text']);
            } else {
              addInterest(
                  DummyProvider.communityCategoryList[categoryIndex]['text']);
            }
          },
        ),
      );

      if (categoryIndex == (limit + startIndex)) {
        addToRow(categories);
        startIndex = categoryIndex;
        categories = <Widget>[];
      }
    }

    addToRow(categories);

    return Scaffold(
      appBar: AppBar(
        title: const HeadingText5(
          text: "Join Community",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: IconButton(
              onPressed: () {},
              icon: CustomIcons.notifications,
            ),
          ),
        ],
        leading: const CustomBackButton(),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    top: 35, bottom: 25, left: CustomGlobal.paddingInline),
                child: HeadingText(
                  text: "What is your area\nof Interest?",
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: rows,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: CustomGlobal.marginBottomButtons,
              left: CustomGlobal.paddingInline,
              right: CustomGlobal.paddingInline,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MainBtn(
                text: 'Continue',
                width: double.infinity,
                height: 60,
                color: CustomColors.blue,
                textColor: Colors.white,
                onPressed: () {
                  widget.areaOfInterestArgs?.onInterestsUpdated!(interests);
                  if (widget.areaOfInterestArgs!.isFromCreateCommunity) {
                    context.pop();
                  } else {
                    Navigator.pushNamed(
                        context, '/community/joinCommunityList');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AreaOfInterestArgs {
  List<String>? selectedInterests;
  void Function(List<String>)? onInterestsUpdated;
  bool isFromCreateCommunity;

  AreaOfInterestArgs(
      {this.onInterestsUpdated,
      this.selectedInterests,
      required this.isFromCreateCommunity});
}
