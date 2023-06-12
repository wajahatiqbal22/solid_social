// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:solid_social/config/config.dart';
import 'package:solid_social/shared/entities/emoji/emoji.dart';
import 'package:solid_social/shared/services/emojis_service.dart';
import 'package:solid_social/src/auth/domain/services/auth_service.dart';
import 'package:solid_social/src/auth/domain/services/user_service.dart';
import 'package:solid_social/src/community/domain/services/communities_service.dart';
import 'package:solid_social/src/community/domain/services/groups_service.dart';
import 'package:solid_social/src/community/domain/services/stream_chat_client/stream_chat_client.dart';
import 'package:solid_social/src/home/domain/services/home_service.dart';
// Package imports:
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Bootstrap extends ChangeNotifier {
  Bootstrap() {
    authService = IAuthService(this);
    userService = IUserService(this);
    communityService = ICommunityService();
    homeService = IHomeService();
    chatClient = IChatClient(StreamChatClient(Config.streamChatAppId, logLevel: Level.WARNING));
    groupsService = IGroupsService(this);
    emojisService = IEmojiService();

    // _getEmojis();
  }

  late AuthService authService;
  late UserService userService;
  late CommunityService communityService;
  late HomeService homeService;
  late GroupsService groupsService;
  late ChatClient chatClient;
  late EmojiService emojisService;

  List<Emoji> getEmojis() {
    return emojisService.getEmojis();
  }

  Map<String, dynamic> get emojisMap => emojisService.getEmojisMap();
}
