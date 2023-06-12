// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';
// Project imports:
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../../../../utils/assets/buttons.dart';

class InviteCommunityMembersScreen extends StatelessWidget {
  const InviteCommunityMembersScreen({Key? key, required this.args}) : super(key: key);

  final InviteCommunityMembersArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText5(
          text: "Invite Members",
        ),
        leading: const CustomBackButton(),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Share.share(args.community.shareLink!);
                },
                child: SingleChildScrollView(
                  key: const PageStorageKey("inviteMembersShareOptions"),
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SocialCircleIcon(
                          icon: Icon(
                            Iconsax.export_1,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.black,
                          title: "Share",
                        ),
                        SocialCircleIcon(
                          icon: Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                          ),
                          backgroundColor: Color(0xFF1D9BF0),
                          title: "Twitter",
                        ),
                        SocialCircleIcon(
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                            size: 30,
                          ),
                          backgroundGradient: LinearGradient(
                            colors: [
                              Color(0xFFA808F1),
                              Color(0xFFFD0498),
                              Color(0xFFFF1D30),
                              Color(0xFFFFC400),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          title: "Instagram",
                        ),
                        SocialCircleIcon(
                          icon: Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                            size: 30,
                          ),
                          backgroundColor: Color(0xFF3A5897),
                          title: "Facebook",
                        ),
                        SocialCircleIcon(
                          icon: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                            size: 30,
                          ),
                          backgroundColor: Color(0xFF11BB19),
                          title: "Whatsapp",
                        ),
                        SocialCircleIcon(
                          icon: Icon(
                            FontAwesomeIcons.telegram,
                            color: Color(0xFF28A8E9),
                            size: 56,
                          ),
                          backgroundColor: Colors.white,
                          title: "Telegram",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                color: CustomColors.grey25Black,
                height: 30,
                thickness: 0.5,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: CustomGlobal.paddingInline,
                  right: CustomGlobal.paddingInline,
                  top: 20,
                ),
                child: HeadingText5(text: "Community link"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 15),
                child: InputFieldCopy(
                  onActionClicked: () async {
                    await Clipboard.setData(ClipboardData(text: args.community.shareLink ?? ""));
                  },
                  placeholder: args.community.shareLink ?? "",
                ),
              ),
              const Divider(
                color: CustomColors.grey25Black,
                height: 25,
                thickness: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: MainBtnIcon2(
                  text: const InterText(
                    text: "Add by email",
                    color: CustomColors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  icon: CustomIcons.email,
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                  elevation: 5,
                  shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: MainBtnIcon2(
                  text: const InterText(
                    text: "Add from contacts",
                    color: CustomColors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  icon: CustomIcons.contacts,
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                  elevation: 5,
                  shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
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
                  if (args.isCreating) {
                    context.off(AppRouter.successCreateCommunity);
                  } else {
                    context.pop();
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

class InviteCommunityMembersArgs {
  final Community community;
  final bool isCreating;
  InviteCommunityMembersArgs({required this.community, this.isCreating = true});
}
