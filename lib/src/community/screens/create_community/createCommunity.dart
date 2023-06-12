// Flutter imports:
import 'dart:developer';

import 'package:flutter/material.dart';
// Package imports:
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/extensions/string_extension.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/community/controllers/create_community_controller.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/community/screens/area_of_interest.dart';
import 'package:solid_social/src/community/screens/create_community/inviteCommunityMembers.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../../../../utils/assets/buttons.dart';
import '../../../../utils/assets/colors.dart';

class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({Key? key, required this.controller})
      : super(key: key);

  final CreateCommunityController controller;

  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends State<CreateCommunityScreen> {
  final double _paddingTop = 25;
  final double _paddingInline = 25;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _areaOfInterest = TextEditingController();
  final TextEditingController _privacy = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  //User interest
  List<String> userInterests = List.empty(growable: true);

  void setUserInterest(interests) {
    userInterests = interests;
    setState(() {});
  }

  void removeUserInterest(String interest) {
    userInterests.remove(interest);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.controller,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const HeadingText5(
            text: "Create Community",
          ),
          foregroundColor: Colors.black,
          leading: const CustomBackButton(),
        ),
        body: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                top: _paddingTop, left: _paddingInline, right: _paddingInline),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderSubText(
                      text: "Enter your community details to create"),
                  InputField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "This field is mandatory";
                      }
                      return null;
                    },
                    controller: _name,
                    placeholder: "Community Name",
                    paddingTop: 35,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.toNamed(
                        AppRouter.areaOfInterest,
                        arguments: AreaOfInterestArgs(
                            onInterestsUpdated: (interests) {
                              setUserInterest(interests);
                            },
                            //If user wants to edit interests after selection
                            selectedInterests: userInterests,
                            isFromCreateCommunity: true),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.all(20.0),
                      height: userInterests.isEmpty
                          ? context.height * 0.08
                          : context.height * 0.1,
                      width: context.width,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4FAFF),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: const Color(0xFFD3DCE4),
                        ),
                      ),
                      child: userInterests.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: userInterests.length,
                              itemBuilder: (context, index) {
                                return CustomGridButton(
                                  text: userInterests[index],
                                  isFocused: true,
                                  isChip: true,
                                  onChipRemoveClick: () {
                                    removeUserInterest(userInterests[index]);
                                  },
                                );
                              })
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Area of interest',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CustomDropdownButton<CommunityPrivacy>(
                      value: CommunityPrivacy.public,
                      onChanged: (val) {
                        widget.controller.community =
                            widget.controller.community.copyWith(privacy: val!);
                      },
                      items: CommunityPrivacy.values
                          .map((e) => DropdownMenuItem<CommunityPrivacy>(
                              value: e,
                              child: Text(e.name.capitalizeFirstLetter)))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: CustomGlobal.marginBottomButtons,
                        top: CustomGlobal.marginBottomButtons),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Builder(builder: (context) {
                        return MainBtn(
                          isLoading: context.select(
                                  (CreateCommunityController value) =>
                                      value.state) ==
                              Loading.processing,
                          text: 'Continue',
                          width: double.infinity,
                          height: 60,
                          color: CustomColors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (userInterests.isEmpty) {
                                context.showSnackbar(
                                    'Please select atleast 1 interest',
                                    isError: true);
                                return;
                              }
                              widget.controller.createCommunity(
                                  name: _name.text,
                                  interests: userInterests,
                                  privacy: _privacy.text,
                                  onSuccess: (community) {
                                    context.off(
                                        AppRouter.inviteCommunityMembers,
                                        arguments: InviteCommunityMembersArgs(
                                            community: community));
                                  },
                                  onError: (exception) {
                                    context.showSnackbar(exception.message ??
                                        "Something went wrong while creating the community.");
                                  });
                            }
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
