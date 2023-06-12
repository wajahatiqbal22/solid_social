import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/events/controller/event_controller.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../../domain/entities/event/event.dart';

class ScheduledEvents extends StatefulWidget {
  const ScheduledEvents({
    Key? key,
  }) : super(key: key);

  @override
  State<ScheduledEvents> createState() => _ScheduledEventsState();
}

class _ScheduledEventsState extends State<ScheduledEvents> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Builder(builder: (context) {
      final scheduledEvents = context
          .read<EventController>()
          .allEvents
          .where((element) => element.eventDateTime.isAfter(DateTime.now().add(const Duration(days: 1))))
          .toList();
      final state = context.select((EventController con) => con.state);
      return state == Loading.processing
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              itemCount: scheduledEvents.length,
              itemBuilder: (context, i) {
                final event = scheduledEvents[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline, vertical: 8),
                  child: EventsCard(
                    event: event,
                    subIcon: CustomIcons.calendar2(color: Colors.white),
                    mainButtonText: "Set Reminder",
                    mainButtonOnPressed: () {
                      Navigator.pushNamed(context, AppRouter.eventVideoChats);
                    },
                  ),
                );
              },
            );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class EventsCard extends StatefulWidget {
  final dynamic subIcon;
  final String peopleAltText;
  final Color backgroundColor;
  final String? backgroundOverlayImageAsset;
  final String mainButtonText;
  final Function() mainButtonOnPressed;
  final Event event;

  const EventsCard({
    super.key,
    required this.event,
    required this.subIcon,
    required this.mainButtonText,
    required this.mainButtonOnPressed,
    this.peopleAltText = "going",
    this.backgroundColor = const Color(0xFF1B4965),
    this.backgroundOverlayImageAsset,
  });

  @override
  State<EventsCard> createState() => _EventsCardState();
}

class _EventsCardState extends State<EventsCard> {
  final double _contentVerticalSpacing = 10;

  final double _contentHorizontalSpacing = 10;

  final double _containerPadding = 16;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.event.groupIds.isNotEmpty) {
        context.read<EventController>().getEventMembers(widget.event.groupIds, widget.event.eventId);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool shouldImage = false;
    if (widget.backgroundOverlayImageAsset != null) {
      shouldImage = true;
    }
    return Container(
      margin: const EdgeInsets.only(top: CustomGlobal.paddingTop),
      height: 229,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        image: shouldImage
            ? DecorationImage(
                image: AssetImage(widget.backgroundOverlayImageAsset!),
                fit: BoxFit.fill,
              )
            : null,
      ),
      child: Column(
        children: [
          // TITLE ROW
          Padding(
            padding: EdgeInsets.only(left: _containerPadding, right: _containerPadding, top: _containerPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: HeadingText3(
                      text: widget.event.eventName,
                      textColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child:
                          IconButton(onPressed: () {}, icon: CustomIcons.postOptions(color: Colors.white, width: 23)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _contentVerticalSpacing,
          ),
          // DATE ROW
          Padding(
            padding: EdgeInsets.only(left: _containerPadding, right: _containerPadding),
            child: Row(
              children: [
                widget.subIcon,
                const SizedBox(
                  width: 10,
                ),
                InterText(
                  text: DateFormat('dd E yy hh:mm').format(widget.event.eventDateTime),
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: _contentVerticalSpacing,
          ),
          // HOST DETAILS ROW
          Padding(
            padding: EdgeInsets.only(left: _containerPadding, right: _containerPadding),
            child: Row(
              children: [
                ProfilePictureImage(
                  asset: widget.event.host.profilePic,
                  width: 24,
                ),
                SizedBox(
                  width: _contentHorizontalSpacing,
                ),
                const InterText(
                  text: "Host",
                  color: Colors.white,
                ),
                SizedBox(
                  width: _contentHorizontalSpacing,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0x1A000000),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: InterText(
                    text: widget.event.host.hostName,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomIcons.personTwo2(
                        color: Colors.white,
                        width: 24,
                      ),
                      SizedBox(
                        width: _contentHorizontalSpacing / 2,
                      ),
                      Builder(builder: (context) {
                        final members = context
                            .select((EventController controller) => controller.eventMembers[widget.event.eventId]);

                        if (widget.event.groupIds.isEmpty) {
                          return InterText(
                            text: "0 ${widget.peopleAltText}",
                            color: Colors.white,
                          );
                        }
                        return members == null
                            ? const Center(child: CircularProgressIndicator())
                            : InterText(
                                text: "${members.length} ${widget.peopleAltText}",
                                color: Colors.white,
                              );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),

          const Divider(
            height: 30,
            thickness: 0.5,
            color: CustomColors.grey25,
          ),

          Padding(
            padding: EdgeInsets.only(left: _containerPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: MainBtn(
                    text: widget.mainButtonText,
                    onPressed: widget.mainButtonOnPressed,
                    textColor: CustomColors.blue,
                  ),
                ),
                ConstrainedBox(constraints: const BoxConstraints(maxWidth: 12, minWidth: 5)),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      height: 50,
                      width: 50,
                      child: CustomIcons.share2(width: 24),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
