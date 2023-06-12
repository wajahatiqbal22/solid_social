import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/events/controller/event_controller.dart';
import 'package:solid_social/src/events/screens/join_events/video_chat_screen.dart';
import 'package:solid_social/src/events/screens/widgets/scheduled_events_list.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/colors.dart';

import '../../domain/entities/event/event.dart';

class OngoingEvents extends StatefulWidget {
  const OngoingEvents({
    Key? key,
  }) : super(key: key);

  @override
  State<OngoingEvents> createState() => _OngoingEventsState();
}

class _OngoingEventsState extends State<OngoingEvents> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Builder(builder: (context) {
      final eventController = context.read<EventController>();
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day, 0, 0);
      final todayEnd = DateTime(now.year, now.month, now.day, 23, 59);
      final onGoingEvents = context
          .read<EventController>()
          .allEvents
          .where((element) => element.eventDateTime.isAfter(todayStart) && element.eventDateTime.isBefore(todayEnd))
          .toList();
      final state = context.select((EventController con) => con.state);
      return Padding(
        padding: const EdgeInsets.only(left: CustomGlobal.paddingInline, right: CustomGlobal.paddingInline),
        child: ListView.builder(
          itemCount: onGoingEvents.length + 1,
          itemBuilder: (BuildContext context, int index) {
            // standup event condition to remove
            if (index == onGoingEvents.length) {
              final aiLabEvent = Event(
                eventId: "testtest123",
                communityId: "",
                eventName: "AI Lab Standup",
                isPrivate: false,
                isRecording: false,
                groupIds: [],
                host: const EventHost(hostId: "IhGbN8KLVkMYuYcRjmw47NzawEF2", hostName: "Wajahat"),
                createdAt: DateTime.now(),
                eventDateTime: DateTime.now(),
              );
              return Column(
                children: [
                  EventsCard(
                    event: aiLabEvent,
                    subIcon: SvgPicture.asset("assets/custom_icons/play.svg"),
                    peopleAltText: "Participants",
                    backgroundColor: CustomColors.blue,
                    backgroundOverlayImageAsset: "assets/backgrounds/cards/cardOverlay.png",
                    mainButtonText: "Join Now",
                    mainButtonOnPressed: () {
                      Navigator.pushNamed(context, AppRouter.eventVideoChats,
                          arguments: VideoChatScreenArgs(event: aiLabEvent, eventController: eventController));
                    },
                  ),
                  // EventsCard(
                  //   event: onGoingEvents[index],
                  //   subIcon: SvgPicture.asset("assets/custom_icons/play.svg"),
                  //   peopleAltText: "Participants",
                  //   backgroundColor: CustomColors.blue,
                  //   backgroundOverlayImageAsset: "assets/backgrounds/cards/cardOverlay.png",
                  //   mainButtonText: "Join Now",
                  //   mainButtonOnPressed: () {
                  //     // Navigator.pushNamed(context, AppRouter.eventVideoChats,
                  //     //     arguments: VideoChatScreenArgs(
                  //     //         eventController: eventController));
                  //   },
                  // )
                ],
              );
            }
            return EventsCard(
              event: onGoingEvents[index],
              subIcon: SvgPicture.asset("assets/custom_icons/play.svg"),
              peopleAltText: "Participants",
              backgroundColor: CustomColors.blue,
              backgroundOverlayImageAsset: "assets/backgrounds/cards/cardOverlay.png",
              mainButtonText: "Join Now",
              mainButtonOnPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRouter.eventVideoChats,
                  arguments: VideoChatScreenArgs(
                    eventController: eventController,
                    event: onGoingEvents[index],
                  ),
                );
              },
            );
          },
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
