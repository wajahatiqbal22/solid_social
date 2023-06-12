// Package imports:
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// Project imports:
import 'package:solid_social/src/app/bootstrap/bootstrap_controller.dart';
import 'package:solid_social/src/home/domain/models/discussion_group/discussion_group.dart';

class ChatController extends BootstrapController {
  ChatController(super.services, {required this.channel, this.group});

  final Channel channel;
  final DiscussionGroup? group;
}
