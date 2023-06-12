// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:solid_social/src/dummy/dummy_provider.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class EditInterestsScreen extends StatelessWidget {
  const EditInterestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    List<Widget> categories = <Widget>[];
    const int limit = 7;
    int startIndex = 0;

    addToRow(List<Widget> categories) {
      rows.add(Padding(
        padding: const EdgeInsets.only(left: CustomGlobal.paddingInline),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: categories,
        ),
      ));
    }

    for (int categoryIndex = startIndex; categoryIndex < DummyProvider.communityCategoryList.length; categoryIndex++) {
      categories.add(
        CustomGridButton(
          text: DummyProvider.communityCategoryList[categoryIndex]["text"],
          isFocused: DummyProvider.communityCategoryList[categoryIndex]["isFocused"],
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
          text: "Edit Interest",
        ),
        leading: const CustomBackButton(),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 35, bottom: 25, left: CustomGlobal.paddingInline),
                  child: InterText(
                    text: "Select your area of interest, this will allow \nyou to discover relevant contents",
                    color: CustomColors.grey75,
                  )),
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
                text: 'Save Changes',
                width: double.infinity,
                height: 60,
                color: CustomColors.blue,
                textColor: Colors.white,
                onPressed: () => {
                  Navigator.pushNamed(context, '/community/joinCommunityList'),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
