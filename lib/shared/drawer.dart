// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:solid_social/src/events/controller/event_controller.dart';
import 'package:solid_social/src/events/screens/schedule_events.dart';
import 'package:solid_social/src/home/controllers/home_controller.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/lists.dart';

import '../utils/assets/images.dart';
import '../utils/assets/textstyles.dart';

class MainDrawer extends StatelessWidget {
  final double _paddingInline = 15;
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final community = context.select((HomeController controller) => controller.selectedCommunity);
      return Drawer(
        width: 350,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 50, left: 5, right: 15, bottom: 5),
              decoration: const BoxDecoration(
                color: CustomColors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 15,
                  left: _paddingInline,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (community != null && community.photoUrl != null)
                            ProfilePictureImage(
                              enableLink: true,
                              asset: community.photoUrl!,
                              notification: false,
                            )
                          else if (community != null)
                            CircularNameInitials(name: community.communityName)
                          else
                            const SizedBox(),
                          Padding(
                            padding: const EdgeInsets.only(top: 6, left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  text: community?.communityName ?? "",
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 8),
                                //   child: InterText(
                                //     text:
                                //         community?.areaOfInterest.join(',') ??
                                //             "",
                                //     color: const Color(0xFFD3DCE4),
                                //     fontSize: 10,
                                //   ),
                                // ),
                                community?.areaOfInterest != null
                                    ? DrawerInterestListView(
                                        areaOfInterest: community!.areaOfInterest)
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: DrawerHeaderButtonList(
                          text: "All Members",
                          icon: HeaderListIcon(
                            onPressed: () {},
                          ),
                          onPressed: () {},
                        ),
                      ),
                      DrawerHeaderButtonList(
                        text: "Discussion Groups",
                        onPressed: () {
                          context.toNamed(AppRouter.discoverDiscussionGroups);
                        },
                        icon: HeaderListIcon(
                          onPressed: () {},
                        ),
                      ),
                      DrawerHeaderButtonList(
                        text: "Events",
                        onPressed: () {
                          context.toNamed(AppRouter.scheduledEvents,
                              arguments: ScheduledEventsArgs(EventController(
                                  context.read<Bootstrap>(),
                                  selectedCommunity:
                                      context.read<HomeController>().selectedCommunity!)));
                        },
                      ),
                      DrawerHeaderButtonList(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouter.finances);
                        },
                        text: "Finances",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 25,
              ),
              padding: EdgeInsets.only(
                left: _paddingInline,
                right: _paddingInline,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      final controller = context.read<HomeController>();
                      final communities =
                          context.select((HomeController value) => value.communities);
                      return controller.state == Loading.processing
                          ? const Center(child: CircularProgressIndicator.adaptive())
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 25),
                                  child: HeadingText4(
                                    text: "Other Communities",
                                    color: CustomColors.grey75,
                                  ),
                                ),
                                ...communities
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: CustomListItem(
                                          title: e.communityName,
                                          subtitle: e.areaOfInterest.join(', '),
                                          imageUrl: community?.photoUrl,
                                          paddingBottom: 0,
                                          onButtonPressed: () {
                                            controller.changeSelectedCommunity(e);
                                            // controller.selectedCommunity = e;
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ],
                            );
                    },
                  ),

                  // Container(
                  //   height: _buttonHeight,
                  //   margin: const EdgeInsets.only(
                  //     bottom: 15,
                  //   ),
                  //   decoration: const BoxDecoration(
                  //     border: Border(
                  //       bottom: BorderSide(
                  //         color: CustomColors.grey25Black,
                  //         width: 0.5,
                  //       ),
                  //     ),
                  //   ),
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     style: ButtonStyle(
                  //       backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  //       padding: MaterialStateProperty.all(EdgeInsets.zero),
                  //       elevation: MaterialStateProperty.all(0),
                  //     ),
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: const [
                  //         ProfilePictureImage(
                  //           asset: 'assets/sampleImage3.png',
                  //           notification: false,
                  //           width: 60,
                  //           height: 60,
                  //         ),
                  //         HeaderProfileNameText(
                  //           text: 'Sweet Boys',
                  //           subtext: 'Fashiontrend.solidsocial.com',
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   height: _buttonHeight,
                  //   margin: const EdgeInsets.only(
                  //     bottom: 15,
                  //   ),
                  //   decoration: const BoxDecoration(
                  //     border: Border(
                  //       bottom: BorderSide(
                  //         color: CustomColors.grey25Black,
                  //         width: 0.5,
                  //       ),
                  //     ),
                  //   ),
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     style: ButtonStyle(
                  //       backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  //       padding: MaterialStateProperty.all(EdgeInsets.zero),
                  //       elevation: MaterialStateProperty.all(0),
                  //     ),
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: const [
                  //         ProfilePictureImage(
                  //           asset: 'assets/sampleImage4.png',
                  //           notification: true,
                  //           height: 60,
                  //           width: 60,
                  //         ),
                  //         HeaderProfileNameText(
                  //           text: 'Sport Nation',
                  //           subtext: 'Fashiontrend.solidsocial.com',
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  Container(
                    height: 20,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: AddItemText(
                      onPressed: () {
                        context.toNamed(AppRouter.addCommunity,
                            arguments: context.read<HomeController>());
                      },
                      text: 'Add Community',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 150),
              padding: EdgeInsets.only(
                left: _paddingInline,
                right: _paddingInline,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: CustomColors.grey25Black,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InterTextFunction(
                    text: 'Community Settings',
                    onPressed: () async {
                      context.toNamed(AppRouter.settings);
                    },
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    paddingTop: 25,
                  ),
                  InterTextFunction(
                    text: 'Support',
                    onPressed: () async {},
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    paddingTop: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: InterTextFunction(
                            text: 'Log Out',
                            onPressed: () async {
                              await context.read<AuthController>().signOut();
                            },
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            paddingTop: 25,
                          ),
                        ),
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            await context.read<AuthController>().signOut();
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class HeaderListIcon extends StatelessWidget {
  const HeaderListIcon({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.add,
        size: 24,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}

class DrawerInterestListView extends StatelessWidget {
  const DrawerInterestListView({super.key, required this.areaOfInterest});

  final List<String> areaOfInterest;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.03,
      width: context.width * 0.5,
      // color: Colors.red,
      padding: const EdgeInsets.only(top: 5),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: areaOfInterest.length,
          itemBuilder: (context, index) {
            return InterText(
              text: '${areaOfInterest[index]}, ',
              color: const Color(0xFFD3DCE4),
              fontSize: 10,
            );
          }),
    );
  }
}
