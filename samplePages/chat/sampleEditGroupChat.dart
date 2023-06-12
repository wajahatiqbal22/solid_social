import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../routes.dart';

class EditGroupChatScreen extends StatelessWidget {
  const EditGroupChatScreen({Key? key}) : super(key: key);

  final double _coverHeight = 164;
  final double _coverWidth = 320;
  final double _profilePictureSize = 75;
  final double _overlayOpacity = 0.35;
  final double _profilePictureBorderSize = 3;
  final double _formSpacing = 20;

  @override
  Widget build(BuildContext context) {
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
                  _coverImageSection(context),
                  _profilePictureSection(context),
                ],
              ),
            ),
            _groupNameSection(),
            SizedBox(height: _formSpacing),
            _topicSection(),
            SizedBox(height: _formSpacing),
            _descriptionSection(),
            SizedBox(height: _formSpacing * 2),
            _bottomButton(context, (){}),
          ],
        ),
      )
    );
  }

  Widget _descriptionSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
      child: InputField(
        initialValue: "Fashion is the essence of life dressing to the latest fashion trends and events is the  new deal stay up to date with the latest fashion news.",
        labelText: "Description",
        textStyle: TextStyle(
          fontSize: 12
        ),
        labelStyle: TextStyle(
          fontSize: 14
        ),
        limit: 255,
        maxLines: 3,
      ),
    );
  }

  Widget _topicSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
      child: InputField(
        initialValue: "Talks about the latest fashion events around the world",
        labelText: "Topic",
        textStyle: TextStyle(
          fontSize: 12
        ),
        labelStyle: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _groupNameSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
      child: InputField(
        initialValue: "Group Name",
        labelText: "Group Name",
        textStyle: TextStyle(
          fontSize: 12
        ),
        labelStyle: TextStyle(
          fontSize: 14
        ),
      ),
    );
  }

  Widget _profilePictureSection(BuildContext context) {
    return Positioned(
      top: _coverHeight - _profilePictureSize / 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(
                color: Colors.white,
                width: _profilePictureBorderSize,
              )
          ),
          borderRadius: BorderRadius.circular(300.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ProfilePictureImage2(
              imageAsset: "assets/sample_images/avatars/avatar2.png",
              size: _profilePictureSize,
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
                  onTap: (){},
                  customBorder: const CircleBorder(),
                ),
              ),
            ),
            CustomIcons.camera2(
              color: Colors.white
            ),
          ],
        ),
      ),
    );
  }

  Widget _coverImageSection(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      semanticContainer: true,
      elevation: 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/sample_images/fashion-cover.png",
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
                onTap: (){},
              ),
            )
          ),
          SizedBox(
            height: _coverHeight,
            width: _coverWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIcons.editGallery(
                    color: Colors.white,
                    size: 18
                ),
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
  }

  Widget _bottomButton(BuildContext context, Function() onPressed) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: MainBtn(
        paddingRight: CustomGlobal.paddingInline,
        paddingLeft: CustomGlobal.paddingInline,
        color: CustomColors.blue,
        text: "Save",
        onPressed: (){
          Navigator.popAndPushNamed(context, SampleAppRouter.chatSettings);
        },
        textColor: Colors.white,
      ),
    );
  }
}

