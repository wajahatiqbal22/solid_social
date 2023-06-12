// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/community/controllers/groups_controller.dart';
import 'package:solid_social/src/community/screens/discussion_groups/group_chat/edit_group_chat.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../../../../utils/GLOBAL.dart';
import '../../../../utils/assets/buttons.dart';
import '../../../../utils/assets/colors.dart';

class AddGroupMembersScreen extends StatefulWidget {
  const AddGroupMembersScreen({Key? key, required this.args}) : super(key: key);

  final AddGroupMembersArgs args;

  @override
  State<AddGroupMembersScreen> createState() => _AddGroupMembersScreenState();
}

class _AddGroupMembersScreenState extends State<AddGroupMembersScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.args.controller.getCommunityMembers();
    });
    super.initState();
  }

  final rows = <Widget>[];
  List<Widget> users = <Widget>[];
  int limit = 4;
  int startIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.args.controller,
      child: Builder(builder: (context) {
        final controller = context.watch<GroupsController>();
        return WillPopScope(
          onWillPop: () {
            controller.updateAllSelectedMembers(false);
            return Future.value(true);
          },
          child: Scaffold(
            appBar: AppBar(
              title: const HeadingText5(
                text: "Add Members",
              ),
            ),
            body: Stack(
              children: [
                Padding(
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
                                    padding: const EdgeInsets.only(left: 10),
                                    child: CustomCheckBox(
                                      isSelected: controller.selectedMembers.length == controller.members.length,
                                      onChanged: (checked) {
                                        controller.updateAllSelectedMembers(checked);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 15),
                        child: InputField(
                          placeholder: "Search Name",
                          prefixIcon: CustomIcons.search(color: CustomColors.grey75),
                          contentPadding: 5,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Builder(builder: (context) {
                          final chips = context.select((GroupsController con) => con.chips);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (final chip in chips)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: chip
                                        .map((e) => UserChip(
                                              user: e,
                                              onRemoved: () {
                                                controller.updateSelectedMembers(e, false);
                                              },
                                            ))
                                        .toList(),
                                  ),
                                ),
                            ],
                          );
                        }),
                      ),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            return controller.state == Loading.processing
                                ? const Center(child: CircularProgressIndicator.adaptive())
                                : controller.members.isEmpty
                                    ? const Center(
                                        child: Text(
                                        "No members in community.\nInvite some.",
                                        textAlign: TextAlign.center,
                                      ))
                                    : ListView.separated(
                                        padding: const EdgeInsets.only(
                                          left: CustomGlobal.paddingInline,
                                          right: CustomGlobal.paddingInline,
                                          top: 15,
                                          bottom: 5,
                                        ),
                                        itemCount: controller.members.length,
                                        itemBuilder: (context, i) {
                                          final member = controller.members[i];
                                          return MemberItem(
                                            isSelected:
                                                controller.selectedMembers.any((element) => element.uid == member.uid),
                                            member: member,
                                            onSelected: (isSelected) {
                                              controller.updateSelectedMembers(member, isSelected);
                                            },
                                          );
                                        },
                                        separatorBuilder: (context, i) {
                                          return const Divider();
                                        },
                                      );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: CustomGlobal.paddingInline, right: CustomGlobal.paddingInline),
                          child: MainBtn(
                            onPressed: () async {
                              // await widget.args.channel.create();

                              context.toNamed(
                                AppRouter.editGroupChat,
                                arguments: EditGroupChatArgs(
                                  members: controller.selectedMembers,
                                  group: widget.args.group,
                                  controller: widget.args.controller,
                                ),
                              );
                            },
                            text: "Next",
                            color: CustomColors.blue,
                            textColor: Colors.white,
                            width: double.infinity,
                            bottomMargin: CustomGlobal.marginBottomButtons,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class UserChip extends StatelessWidget {
  const UserChip({
    Key? key,
    required this.user,
    this.onRemoved,
  }) : super(key: key);

  final SolidSocialUser user;
  final Function()? onRemoved;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          user.userDetails.profileUrl == null
              ? CircularNameInitials(name: user.firstName, radius: 15)
              : ProfilePictureImage(
                  asset: user.userDetails.profileUrl,
                  width: 35,
                  fit: BoxFit.cover,
                  height: 35,
                ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: InterText(text: user.firstName),
          ),
          GestureDetector(
            onTap: onRemoved,
            child: const Icon(
              Icons.close_rounded,
              color: CustomColors.grey75,
            ),
          )
        ],
      ),
    );
  }
}

class MemberItem extends StatelessWidget {
  const MemberItem({
    Key? key,
    required this.member,
    this.onSelected,
    this.isSelected = false,
  }) : super(key: key);

  final SolidSocialUser member;
  final bool isSelected;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              children: [
                CircularNameInitials(name: "${member.firstName} ${member.lastName}"),
                const SizedBox(width: 15),
                InterText(
                  text: "${member.firstName} ${member.lastName}",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            )
          ],
        ),
        CustomCheckBox(
          isSelected: isSelected,
          onChanged: onSelected,
        ),
      ],
    );
  }
}

class AddGroupMembersArgs {
  final DiscussionGroup group;
  final GroupsController controller;

  AddGroupMembersArgs({
    required this.group,
    required this.controller,
  });
}
