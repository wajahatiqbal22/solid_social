// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/constants/auth_exception_messages.dart';
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:solid_social/src/home/tabs/timeline/widgets/sheets.dart';
import 'package:solid_social/src/profile/controllers/account_controller.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final double _coverHeight = 164;

  final double _coverWidth = 320;

  final double _profilePictureSize = 75;

  final double _overlayOpacity = 0.35;

  final double _profilePictureBorderSize = 3;

  final double _formSpacing = 20;

  File? photoFile;
  File? bannerFile;

  TextEditingController _bio = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  @override
  void initState() {
    _bio.text = context.read<AuthController>().solidSocialUser.userDetails.bio ?? "";
    _firstName.text = context.read<AuthController>().solidSocialUser.firstName;
    _lastName.text = context.read<AuthController>().solidSocialUser.lastName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          AccountController(context.read<Bootstrap>(), currentUser: context.read<AuthController>().solidSocialUser),
      child: Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: const HeadingText5(
              text: "Edit Profile",
            ),
            elevation: 0,
            centerTitle: true,
          ),
          body: Builder(builder: (context) {
            final controller = context.read<AccountController>();
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: _coverHeight + _profilePictureSize,
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.topCenter,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          semanticContainer: true,
                          elevation: 0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (controller.currentUser.userDetails.bannerUrl != null || bannerFile != null)
                                if (bannerFile != null)
                                  Image.file(
                                    bannerFile!,
                                    fit: BoxFit.cover,
                                    height: _coverHeight,
                                    width: _coverWidth,
                                  )
                                else
                                  Image.network(
                                    controller.currentUser.userDetails.bannerUrl!,
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
                                    final option = await showImageSourceSheet(context);
                                    if (option != null) {
                                      final photo =
                                          await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 30);
                                      if (photo != null) {
                                        setState(() {
                                          bannerFile = File(photo.path);
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
                        ),
                        Positioned(
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
                                if (controller.currentUser.userDetails.profileUrl != null || photoFile != null)
                                  if (photoFile != null)
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage: FileImage(photoFile!),
                                      backgroundColor: Colors.blueGrey,
                                    )
                                  else
                                    CircularNetworkImage(
                                      imageUrl: controller.currentUser.userDetails.profileUrl!,
                                      size: 40,
                                    ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(_overlayOpacity),
                                    borderRadius: BorderRadius.circular(300.0),
                                  ),
                                  width: 80,
                                  height: 80,
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    shape: const CircleBorder(),
                                    child: InkWell(
                                      onTap: () async {
                                        final option = await showImageSourceSheet(context);
                                        if (option != null) {
                                          final photo = await ImagePicker().pickImage(source: option, imageQuality: 30);
                                          if (photo != null) {
                                            print(photo);
                                            setState(() {
                                              photoFile = File(photo.path);
                                            });
                                          }
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                    child: InputField(
                      controller: _firstName,
                      labelText: "First name",
                      textStyle: const TextStyle(fontSize: 12),
                      labelStyle: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                    child: InputField(
                      controller: _lastName,
                      labelText: "Last name",
                      textStyle: const TextStyle(fontSize: 12),
                      labelStyle: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 5),
                    child: InputField(
                      controller: _bio,
                      maxLines: 3,
                      labelText: "Bio",
                      textStyle: const TextStyle(fontSize: 12),
                      labelStyle: const TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: _formSpacing * 2,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(builder: (context) {
                      final isLoading = context.select((AccountController con) => con.state) == Loading.processing;
                      return MainBtn(
                        isLoading: isLoading,
                        paddingRight: CustomGlobal.paddingInline,
                        paddingLeft: CustomGlobal.paddingInline,
                        color: CustomColors.blue,
                        text: "Save",
                        onPressed: () async {
                          await context.read<AccountController>().changeUserDetails(
                              context.read<AuthController>().solidSocialUser,
                              firstName: _firstName.text,
                              lastName: _lastName.text,
                              photoFile: photoFile,
                              bannerFile: bannerFile,
                              bio: _bio.text, onDetailsChanged: (currentUser) {
                            final authController = context.read<AuthController>();
                            authController.solidSocialUser = currentUser;
                            context.pop();
                          }, onError: (e) {
                            context.showSnackbar(e.message ?? kSomethingWentWrongExceptionMessage, isError: true);
                          });
                        },
                        textColor: Colors.white,
                      );
                    }),
                  )
                ],
              ),
            );
          })),
    );
  }
}
