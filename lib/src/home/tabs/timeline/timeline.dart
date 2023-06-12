// Flutter imports:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/src/app/bootstrap/stream_chat_controller/stream_chat_controller.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/home/controllers/home_controller.dart';
import 'package:solid_social/src/home/tabs/timeline/widgets/feed.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key? key, required this.controller, required this.selectedCommunity}) : super(key: key);

  final HomeController controller;
  final Community selectedCommunity;

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> with AutomaticKeepAliveClientMixin {
  late final Channel channel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Builder(
        builder: (context) {
          final state = context.select((StreamChatController value) => value.state);
          final child = state.maybeWhen(
            connecting: () {
              return _loadingWidget;
            },
            error: () {
              return const Center(child: Text("Error connecting user"));
            },
            connectedUser: (user) {
              return Feed(controller: widget.controller.timelineController!);
            },
            orElse: () {
              return _loadingWidget;
            },
          );

          return child;
        },
      ),
    );
  }

  Widget get _loadingWidget => const Center(child: CircularProgressIndicator.adaptive());

  @override
  bool get wantKeepAlive => true;
}
