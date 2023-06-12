// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:solid_social/src/dummy/dummy_provider.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class SampleAddGroupMembersScreen extends StatefulWidget {
  const SampleAddGroupMembersScreen({Key? key}) : super(key: key);

  @override
  State<SampleAddGroupMembersScreen> createState() => _SampleAddGroupMembersScreenState();
}

class _SampleAddGroupMembersScreenState extends State<SampleAddGroupMembersScreen> {
  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    List<Widget> users = <Widget>[];
    const int limit = 5;
    int startIndex = 0;

    addToRow(List<Widget> users) {
      rows.add(Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: users,
        ),
      ));
    }

    for (int userIndex = startIndex; userIndex < DummyProvider.storyList.length; userIndex++) {
      users.add(Container(
        constraints: const BoxConstraints(minWidth: 50, minHeight: 25),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(300.0),
          color: CustomColors.blue50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfilePictureImage(
              asset: DummyProvider.storyList[userIndex]["imageUrl"],
              width: 35,
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: InterText(
                text: DummyProvider.storyList[userIndex]["name"],
              ),
            ),
            const Icon(
              Icons.close_rounded,
              color: CustomColors.grey75,
            )
          ],
        ),
      ));

      if (userIndex == (limit + startIndex)) {
        addToRow(users);
        startIndex = userIndex;
        users = <Widget>[];
      }
    }

    addToRow(users);

    return Scaffold(
      appBar: AppBar(
        title: const HeadingText5(
          text: "Add Members",
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: CustomGlobal.paddingTop),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                    child: Row(
                      children: [
                        const InterText(
                          text: "Select group members",
                          fontWeight: FontWeight.w600,
                          color: CustomColors.grey75,
                          fontSize: 14,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const HeaderSubText(
                                text: "All",
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: CustomCheckBox(onChanged: (checked) {}),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CustomGlobal.paddingInline, vertical: 15),
                    child: InputField(
                      placeholder: "Search Name",
                      prefixIcon: CustomIcons.search(color: CustomColors.grey75),
                      contentPadding: 5,
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: CustomGlobal.paddingInline,
                        right: CustomGlobal.paddingInline,
                        top: 15,
                        bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: const [
                                ProfilePictureImage(
                                  asset: "assets/sample_images/avatars/avatar3.png",
                                  width: 55,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                InterText(
                                  text: "Cindy Moses",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            )
                          ],
                        ),
                        CustomCheckBox(onChanged: (checked) {}),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: CustomGlobal.paddingInline,
                        right: CustomGlobal.paddingInline,
                        top: 15,
                        bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: const [
                                ProfilePictureImage(
                                  asset: "assets/sample_images/avatars/avatar2.png",
                                  width: 55,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                InterText(
                                  text: "James J",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            )
                          ],
                        ),
                        CustomCheckBox(onChanged: (checked) {}),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(
                  left: CustomGlobal.paddingInline, right: CustomGlobal.paddingInline),
              child: MainBtn(
                onPressed: () {
                  Navigator.pushNamed(context, "/homepage");
                },
                text: "Create Group",
                color: CustomColors.blue,
                textColor: Colors.white,
                width: double.infinity,
                bottomMargin: CustomGlobal.marginBottomButtons,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
