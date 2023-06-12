import 'package:flutter/material.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../routes.dart';


class ChatScreen extends StatelessWidget {
  final bool noChats;
  const ChatScreen({
    Key? key,
    required this.noChats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: _titleSection(
          context: context,
          avatarAsset: "assets/sample_images/avatars/avatar2.png",
          memberCount: 40,
          title: "Fashion Events"
        ),
        actions: _actionsSection(),
        centerTitle: false,
        leading: const CustomBackButton(),
      ),
      body: noChats
        ? _contentNoChats()
        : _content(),
      bottomSheet: _bottomSection(),
    );
  }

  Widget _content() {
    return ListView(
      padding: const EdgeInsets.only(
        left: CustomGlobal.paddingInline / 2,
        right: CustomGlobal.paddingInline / 2,
        bottom: 80,
      ),
      children: [
        _dateDivider(
          date: "Feb 14",
          margin: const EdgeInsets.symmetric(vertical: 10)
        ),
        _receivedChatItem(
          profilePictureAsset: "assets/sample_images/avatars/avatar3.png",
          time: "2hrs",
          name: "Cindy Moses",
          message: "Hi everyone, My name is Stephen. Good to be part of this group.",
        ),
        _receivedChatItem(
          profilePictureAsset: "assets/sample_images/avatars/avatar9.png",
          time: "50min",
          name: "Aries Hack",
          message: "Welcome Stephen, its nice to have you",
        ),
        _receivedChatItem(
          profilePictureAsset: "assets/sample_images/avatars/avatar8.png",
          time: "30min",
          name: "Grace barlow",
          message: "Hi everyone, there’s a fashion event coming up on th 26th of february will post the details shortly ",
        ),
        _sentChatItem(
          profilePictureAsset: "assets/sample_images/avatars/avatar10.png",
          time: "5min",
          name: "Stephen Paul",
          message: "Welcome to the group man!"
        ),
      ]
    );
  }

  Widget _sentChatItem({
    required String profilePictureAsset,
    required String time,
    required String name,
    required String message,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InterText(
                    text: "$name ",
                  ),
                  InterText(
                    text: time,
                    color: CustomColors.grey75,
                  ),
                ],
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 230,
                ),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    color: CustomColors.blue,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: const EdgeInsets.all(10),
                child: InterText(
                  text: message,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          ProfilePictureImage(
            asset: profilePictureAsset,
            width: 30,
          ),
        ],
      ),
    );
  }

  Widget _receivedChatItem({
    required String profilePictureAsset,
    required String time,
    required String name,
    required String message,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfilePictureImage(
            asset: profilePictureAsset,
            width: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InterText(
                    text: "$name ",
                  ),
                  InterText(
                    text: time,
                    color: CustomColors.grey75,
                  ),
                ],
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 230,
                ),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: CustomColors.blue50,
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: const EdgeInsets.all(10),
                child: InterText(
                  text: message,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _contentNoChats() {
    const double columnSpacing = 8;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: InterText(
            text: "You Created Group",
            color: CustomColors.grey75,
          ),
        ),
        const SizedBox(
          height: columnSpacing,
        ),
        const Center(
          child: HeadingText3(
            text: "Fashion Events"
          ),
        ),
        const SizedBox(
          height: columnSpacing,
        ),
        _dateDivider(
          date: "Feb 10"
        ),
      ],
    );
  }

  Widget _dateDivider({required String date, EdgeInsets margin = EdgeInsets.zero}) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(
            BorderSide(
                color: CustomColors.grey25Black,
                width: 0.5
            ),
          ),
          borderRadius: BorderRadius.circular(300.0),
        ),
        margin: margin,
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 8,
        ),
        child: InterText(
          text: date,
          color: CustomColors.grey75,
        ),
      ),
    );
  }

  Widget _bottomSection() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 60,
      ),
      height: 0,
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(
                color: CustomColors.grey25Black,
                width: 0.5,
              )
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.add,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5
              ),
              child: InputField(
                placeholder: "Message",
                fillColor: CustomColors.grey25,
              ),
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: CustomIcons.camera2(),
          ),
          IconButton(
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.only(right: 10),
            onPressed: (){},
            icon: CustomIcons.microphone()
          ),
        ],
      ),
    );
  }

  Widget _titleSection({
    required BuildContext context,
    required String title,
    required String avatarAsset,
    required int memberCount,
  }) {
    return Ink(
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, SampleAppRouter.chatSettings);
        },
        child: Row(
          children: [
            ProfilePictureImage(
              asset: avatarAsset,
              width: 35,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText5(
                  text: title,
                ),
                const SizedBox(
                  height: 3,
                ),
                InterText(
                  text: "$memberCount Members",
                  color: CustomColors.grey75,
                  fontSize: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _actionsSection() {
    return [
      IconButton(
        onPressed: (){},
        icon: CustomIcons.call(),
      ),
      IconButton(
        onPressed: (){},
        icon: CustomIcons.video(),
      )
    ];
  }
}
