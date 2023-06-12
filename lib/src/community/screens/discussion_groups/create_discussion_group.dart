// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/community/controllers/groups_controller.dart';
import 'package:solid_social/src/community/screens/discussion_groups/add_group_members.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../../../../utils/assets/buttons.dart';
import '../../../../utils/assets/colors.dart';
import '../../../app/router/routes.dart';

class CreateDiscussionGroupScreen extends StatefulWidget {
  const CreateDiscussionGroupScreen({Key? key, required this.controller}) : super(key: key);

  final GroupsController controller;

  @override
  State<CreateDiscussionGroupScreen> createState() => _CreateDiscussionGroupScreenState();
}

class _CreateDiscussionGroupScreenState extends State<CreateDiscussionGroupScreen> {
  final double _itemsSpacing = 20.0;
  bool _makePrivateStatus = false;

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.controller,
      child: Builder(builder: (context) {
        final controller = context.read<GroupsController>();
        return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: const Icon(Icons.close),
              ),
              title: const HeadingText5(
                text: "Create Discussion Group",
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: CustomGlobal.paddingTop,
                    left: CustomGlobal.paddingInline,
                    right: CustomGlobal.paddingInline,
                  ),
                  child: Stack(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: _itemsSpacing),
                              child: const HeaderSubText(
                                text: "Fill out the details of your discussion group.",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: _itemsSpacing),
                              child: InputField(
                                controller: _name,
                                validator: (p0) => p0!.isEmpty ? "This field is mandatory" : null,
                                placeholder: "Group Name",
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              height: _itemsSpacing * 2,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: InterText(
                                    text: "Make Private",
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: FlutterSwitch(
                                    value: _makePrivateStatus,
                                    width: 35,
                                    height: 20,
                                    padding: 2,
                                    toggleSize: 15,
                                    activeColor: CustomColors.blue,
                                    inactiveColor: CustomColors.grey25Black,
                                    onToggle: (val) {
                                      setState(() {
                                        _makePrivateStatus = val;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(left: CustomGlobal.paddingInline, right: CustomGlobal.paddingInline),
                    child: Builder(builder: (context) {
                      final isLoading =
                          (context.select((GroupsController controller) => controller.state)) == Loading.processing;

                      return MainBtn(
                        isLoading: isLoading,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            controller.softCreateDiscussionGroup(
                              onCreated: (group) {
                                context.toNamed(AppRouter.addMembers,
                                    arguments: AddGroupMembersArgs(
                                      group: group,
                                      controller: controller,
                                    ));
                              },
                              groupName: _name.text,
                              privacy:
                                  _makePrivateStatus ? DiscussionGroupPrivacy.public : DiscussionGroupPrivacy.private,
                              communityId: controller.selectedCommunity!.id!,
                            );
                          }
                        },
                        text: "Next",
                        color: CustomColors.blue,
                        textColor: Colors.white,
                        width: double.infinity,
                        bottomMargin: CustomGlobal.marginBottomButtons,
                      );
                    }),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
