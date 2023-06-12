// Dart imports:
// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/shared/states/loading_state.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:solid_social/src/community/controllers/join_communities_controller.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/community/screens/area_of_interest.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/lists.dart';

import '../../../../utils/assets/buttons.dart';
import '../../../../utils/assets/colors.dart';
import '../../../../utils/assets/textstyles.dart';

class JoinCommunityScreen extends StatelessWidget {
  const JoinCommunityScreen({Key? key, required this.controller})
      : super(key: key);

  final JoinCommunityController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText5(
          text: "Join Community",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: IconButton(
              onPressed: () {
                context.toNamed(AppRouter.communityNotification, arguments: controller);
              },
              icon: CustomIcons.notifications,
            ),
          ),
        ],
        leading: const CustomBackButton(),
      ),
      body: ChangeNotifierProvider.value(
        value: controller,
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: CustomGlobal.paddingInline),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 25),
                      child: InterText(
                        text: "Communites you showed interest in",
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(
                      child: Builder(builder: (context) {
                        List<Community> communities = [];
                        final LoadingState<List<Community>> state =
                            context.select(
                                (JoinCommunityController value) => value.state);
                        bool isLoading = state == const LoadingState.loading();

                        state.maybeWhen(
                          loaded: (List<Community>? comms) =>
                              communities = comms!,
                          orElse: () {},
                        );

                        return Column(
                          children: [
                            Expanded(
                                child: communities.isEmpty
                                    ? isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator
                                                .adaptive())
                                        : Center(
                                            child: Text(
                                            'There are no communities.\nCreate one.',
                                            textAlign: TextAlign.center,
                                            style: context.textTheme.bodyText1,
                                          ))
                                    : ListView.separated(
                                        separatorBuilder: (context, i) {
                                          return const Divider(
                                            color: CustomColors.grey25Black,
                                            height: 25,
                                            thickness: 0.5,
                                          );
                                        },
                                        itemCount: communities.length,
                                        itemBuilder: (context, index) {
                                          final community = communities[index];
                                          return Builder(builder: (context) {
                                            final jjc = context
                                                .select((JoinCommunityController value) => value.justJoinedCommunities);
                                            final hasJoined = jjc.any((e) => e.id == community.id);
                                            return CustomListItem(
                                              buttonText:
                                                  hasJoined ? "Joined" : "Join",
                                              enableButton: true,
                                              title: community.communityName,
                                              subtitle: community.areaOfInterest
                                                  .join(', '),
                                              imageUrl: community.photoUrl,
                                              paddingBottom: 0,
                                              onButtonPressed: hasJoined
                                                  ? () {}
                                                  : () {
                                                      controller.joinCommunity(community,
                                                          context.read<AuthController>().solidSocialUser.uid);
                                                    },
                                            );
                                          });
                                        }))
                          ],
                        );
                      }),
                    ),
                    // CustomListItem(
                    //   title: "Fashion Trend",
                    //   subtitle: "Fashiontrend.solidsocial.com",
                    //   imageAsset: "assets/sampleImage2.png",
                    //   paddingBottom: 0,
                    //   onButtonPressed: () {},
                    // ),
                    // const Divider(
                    //   color: CustomColors.grey25Black,
                    //   height: 25,
                    //   thickness: 0.5,
                    // ),
                    // CustomListItem(
                    //   title: "Sweet Boys",
                    //   subtitle: "Fashiontrend.solidsocial.com",
                    //   imageAsset: "assets/sampleImage3.png",
                    //   paddingBottom: 0,
                    //   onButtonPressed: () {},
                    // ),
                    // const Divider(
                    //   color: CustomColors.grey25Black,
                    //   height: 25,
                    //   thickness: 0.5,
                    // ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: CustomGlobal.marginBottomButtons,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MainBtn(
                      text: 'Continue',
                      width: double.infinity,
                      height: 60,
                      color: CustomColors.blue,
                      textColor: Colors.white,
                      onPressed: () => {
                        context.toNamed(
                          AppRouter.areaOfInterest,
                          arguments: AreaOfInterestArgs(
                              onInterestsUpdated: (interests) {},
                              isFromCreateCommunity: false),
                        )
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
