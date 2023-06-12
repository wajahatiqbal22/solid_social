// Flutter imports:

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/src/events/controller/event_controller.dart';
import 'package:solid_social/src/home/domain/controller/timeline_controller.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';
import 'package:solid_social/src/home/tabs/timeline/widgets/create_timeline_post.dart';
// Project imports:
import 'package:solid_social/utils/assets/textstyles.dart';

import '../GLOBAL.dart';
import 'buttons.dart';
import 'colors.dart';
import 'images.dart';

class CustomPopup extends StatefulWidget {
  const CustomPopup({required this.eventController, Key? key}) : super(key: key);

  final EventController eventController;
  @override
  State<CustomPopup> createState() => _CustomPopupState();
}

class _CustomPopupState extends State<CustomPopup> {
  final double _columnSpacing = 10;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: widget.eventController,
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 46,
                      height: 5,
                      margin: const EdgeInsets.only(top: 15, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: CustomColors.grey25Black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                    child: HeadingText5(
                      text: "Private Event",
                    ),
                  ),
                  SizedBox(
                    height: _columnSpacing,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                    child: HeaderSubText(text: "Select group(s) to participate in event"),
                  ),
                  SizedBox(
                    height: _columnSpacing * 2,
                  ),
                  Builder(builder: (context) {
                    final eventCon = widget.eventController;
                    final state = context.select((EventController controller) => controller.state);
                    return state == Loading.processing
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ListView.builder(
                                itemCount: eventCon.allGroups.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final group = eventCon.allGroups[index];
                                  final selectedGroupIds = eventCon.selectedGroups.map((e) => e.id).toList();

                                  return Column(
                                    children: [
                                      CustomListItemCheckbox(
                                        isSelected: selectedGroupIds.contains(group.id) ? true : false,
                                        title: group.groupName,
                                        asset: group.displayPhotoUrl,
                                        onChanged: (isChecked) {
                                          toggleCheck(
                                            context,
                                            group: group,
                                            isChecked: isChecked,
                                          );
                                        },
                                      ),
                                      const Divider(
                                        height: 20,
                                        thickness: 0.5,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MainBtn(
                        text: "Save",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: CustomColors.blue,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void toggleCheck(BuildContext context, {required DiscussionGroup group, required bool isChecked}) {
    context.read<EventController>().toggleSelectedGroups(group: group, isChecked: isChecked);
  }
}

class CustomListItemCheckbox extends StatefulWidget {
  final String title;
  final String? asset;
  final Function(bool isChecked)? onChanged;
  final bool? isSelected;
  const CustomListItemCheckbox({
    super.key,
    required this.title,
    required this.asset,
    this.isSelected,
    this.onChanged,
  });

  @override
  State<CustomListItemCheckbox> createState() => _CustomListItemCheckboxState();
}

class _CustomListItemCheckboxState extends State<CustomListItemCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: CustomGlobal.paddingInline, right: 15),
          child: ProfilePictureImage(
            asset: widget.asset,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        HeadingText5(
          text: widget.title,
          fontSize: 14,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: CustomGlobal.paddingInline),
              child: SizedBox(
                width: 16,
                height: 16,
                child: CustomCheckBox(
                  isSelected: widget.isSelected ?? false,
                  onChanged: (checked) {
                    widget.onChanged?.call(checked);
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PopupCreatePost {
  final BuildContext context;
  final TimelineController controller;

  PopupCreatePost({required this.context, required this.controller});

  void popUp() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return CreateTimelinePost(controller: controller);
      },
    );
  }
}
