// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/community/controllers/groups_controller.dart';
import 'package:solid_social/src/community/screens/discussion_groups/group_chat/chat_screen.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';
import 'package:solid_social/src/home/tabs/timeline/widgets/sheets.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class EditGroupChatScreen extends StatefulWidget {
  const EditGroupChatScreen({Key? key, required this.args}) : super(key: key);

  final EditGroupChatArgs args;

  @override
  State<EditGroupChatScreen> createState() => _EditGroupChatScreenState();
}

class _EditGroupChatScreenState extends State<EditGroupChatScreen> {
  final double _coverHeight = 164;

  final double _coverWidth = 320;

  final double _profilePictureSize = 75;

  final double _overlayOpacity = 0.35;

  final double _profilePictureBorderSize = 3;

  final double _formSpacing = 20;

  final TextEditingController _groupName = TextEditingController();
  final TextEditingController _topic = TextEditingController();
  final TextEditingController _description = TextEditingController();

  File? photoFile;
  File? bannerFile;

  @override
  void initState() {
    _groupName.text = widget.args.group.groupName;
    _topic.text = widget.args.group.topic ?? "";
    _description.text = widget.args.group.description ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.args.controller,
      child: Builder(builder: (context) {
        final controller = context.read<GroupsController>();
        return Scaffold(
            appBar: AppBar(
              leading: const CustomBackButton(),
              title: const HeadingText5(
                text: "Edit Group",
              ),
              elevation: 0,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: _coverHeight + _profilePictureSize,
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.topCenter,
                      children: [
                        _coverImageSection(context, widget.args.group.bannerUrl, onFileSelected: (file) {
                          photoFile = file;
                        }),
                        _profilePictureSection(context, null, onFileSelected: (file) {
                          bannerFile = file;
                        }),
                      ],
                    ),
                  ),
                  _groupNameSection(_groupName),
                  SizedBox(height: _formSpacing),
                  _topicSection(_topic),
                  SizedBox(height: _formSpacing),
                  _descriptionSection(_description),
                  SizedBox(height: _formSpacing * 2),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(builder: (context) {
                      final state = context.select((GroupsController controller) => controller.state);
                      return MainBtn(
                        isLoading: state == Loading.processing,
                        paddingRight: CustomGlobal.paddingInline,
                        paddingLeft: CustomGlobal.paddingInline,
                        color: CustomColors.blue,
                        text: "Save",
                        onPressed: () async {
                          final group = widget.args.group.copyWith(
                            groupName: _groupName.text,
                            topic: _topic.text,
                            description: _description.text,
                          );

                          await controller.createDiscussionGroup(
                            photoFile: photoFile,
                            bannerFile: bannerFile,
                            memberIds: widget.args.members.map((e) => e.uid).toList(),
                            group: group,
                            onCreated: (group, channel) async {
                              context.popAll(until: AppRouter.feed);
                              context.toNamed(AppRouter.chatScreen,
                                  arguments: ChatArgs(group: group, channel: channel));
                            },
                            onError: (e) {
                              context.showSnackbar(e.message ?? "", isError: true);
                            },
                          );
                        },
                        textColor: Colors.white,
                      );
                    }),
                  ),
                ],
              ),
            ));
      }),
    );
  }

  Widget _descriptionSection(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
      child: InputField(
        controller: controller,
        labelText: "Description",
        textStyle: const TextStyle(fontSize: 12),
        labelStyle: const TextStyle(fontSize: 14),
        limit: 255,
        maxLines: 3,
      ),
    );
  }

  Widget _topicSection(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
      child: InputField(
        controller: controller,
        labelText: "Topic",
        textStyle: const TextStyle(fontSize: 12),
        labelStyle: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _groupNameSection(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
      child: InputField(
        validator: (p0) => p0!.isEmpty ? "Field is mandatory" : null,
        controller: controller,
        labelText: "Group Name",
        textStyle: const TextStyle(fontSize: 12),
        labelStyle: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _profilePictureSection(BuildContext context, String? photoUrl, {required Function(File?) onFileSelected}) {
    File? imageFile;
    return StatefulBuilder(builder: (context, setState) {
      return Positioned(
        top: _coverHeight - _profilePictureSize / 2,
        child: Container(
          decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(
              color: Colors.white,
              width: _profilePictureBorderSize,
            )),
            borderRadius: BorderRadius.circular(300.0),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: CircleAvatar(
                  backgroundImage: imageFile == null && photoUrl == null
                      ? null
                      : imageFile != null
                          ? FileImage(imageFile!)
                          : NetworkImage(photoUrl!) as ImageProvider,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(_overlayOpacity),
                  borderRadius: BorderRadius.circular(300.0),
                ),
                width: _profilePictureSize,
                height: _profilePictureSize,
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: InkWell(
                    onTap: () async {
                      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (file != null) {
                        setState(() {
                          imageFile = File(file.path);
                          onFileSelected(imageFile);
                        });
                      }
                    },
                    customBorder: const CircleBorder(),
                  ),
                ),
              ),
              CustomIcons.camera2(color: Colors.white),
            ],
          ),
        ),
      );
    });
  }

  Widget _coverImageSection(BuildContext context, String? photoUrl, {required Function(File?) onFileSelected}) {
    File? imageFile;
    return StatefulBuilder(builder: (context, setState) {
      return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        semanticContainer: true,
        elevation: 0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            photoUrl == null && imageFile == null
                ? Positioned.fill(child: Container(color: Colors.blue[50]))
                : imageFile != null
                    ? Image.file(
                        imageFile!,
                        fit: BoxFit.cover,
                        height: _coverHeight,
                        width: _coverWidth,
                      )
                    : Image.network(
                        photoUrl!,
                        fit: BoxFit.cover,
                        height: _coverHeight,
                        width: _coverWidth,
                      ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(_overlayOpacity),
              ),
              height: _coverHeight,
              width: _coverWidth,
            ),
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  final source = await showImageSourceSheet(context);
                  if (source != null) {
                    final file = await ImagePicker().pickImage(source: source, imageQuality: 20);
                    if (file != null) {
                      setState(() {
                        imageFile = File(file.path);
                        onFileSelected(imageFile);
                      });
                    }
                  }
                },
              ),
            )),
            SizedBox(
              height: _coverHeight,
              width: _coverWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcons.editGallery(color: Colors.white, size: 18),
                  const SizedBox(
                    width: 8,
                  ),
                  const InterText(
                    text: "Edit Banner",
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class EditGroupChatArgs {
  final DiscussionGroup group;
  final GroupsController controller;
  final List<SolidSocialUser> members;

  EditGroupChatArgs({
    required this.group,
    required this.controller,
    required this.members,
  });
}
