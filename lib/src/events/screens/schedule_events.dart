// Flutter imports:
import 'dart:developer';

import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/extensions/build_context_extension.dart';

// Project imports:
import 'package:solid_social/src/events/controller/event_controller.dart';
import 'package:solid_social/src/events/screens/widgets/ongoing_events_list.dart';
import 'package:solid_social/src/events/screens/widgets/scheduled_events_list.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import '../../../utils/assets/colors.dart';
import '../../app/router/routes.dart';

class ScheduledEventsScreen extends StatelessWidget {
  const ScheduledEventsScreen({Key? key, required this.args}) : super(key: key);

  final ScheduledEventsArgs args;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: args.controller,
      child: Builder(builder: (context) {
        final _eventController = context.read<EventController>();

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const HeadingText5(
                text: "Events",
              ),
              leading: GestureDetector(
                onTap: () {
                  context.popAll(until: AppRouter.feed);
                },
                child: const Icon(Icons.close),
              ),
              elevation: 0.5,
              bottom: TabBar(
                labelStyle: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.headline5,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                labelColor: CustomColors.blue,
                unselectedLabelColor: CustomColors.grey75,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 50),
                tabs: const <Widget>[
                  Tab(
                    text: "Scheduled",
                  ),
                  Tab(
                    text: "Ongoing",
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                ScheduledEvents(),
                OngoingEvents(),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class ScheduledEventsArgs {
  final EventController controller;

  ScheduledEventsArgs(this.controller);
}
