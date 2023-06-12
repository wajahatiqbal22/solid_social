import 'package:flutter/material.dart';

import 'chat/sampleChatScreen.dart';
import 'chat/sampleChatSettings.dart';
import 'chat/sampleDiscoverDiscussionGroups.dart';
import 'chat/sampleEditGroupChat.dart';
import 'chat/sampleMyDiscussionGroups.dart';
import 'fundraiser/sample_finances.dart';
import 'fundraiser/sample_fundraiser.dart';
import 'group/addMembers.dart';

class SampleAppRouter {
  static const String chatScreenNoChats = '/chatScreenNoChats';
  static const String chatScreenWithChats = '/chatScreenWithChats';
  static const String addGroupMembers = '/addGroupMembers';
  static const String chatSettings = '/chat/settings';
  static const String myDiscussionGroups = '/chat/myDiscussionGroups';
  static const String discoverDiscussionGroups = '/chat/discoverDiscussionGroups';
  static const String editGroupChat = '/chat/editGroup';
  static const String finances = '/fundraiser/finances';
  static const String commentsScreen = '/timeline/comments_screen';
  static const String fundraiserScreen = '/fundraiser/single_fundraiser';

  static Map<String, Widget Function(BuildContext context)> routes = {
    chatScreenNoChats: (context) => const ChatScreen(noChats: true),
    chatScreenWithChats: (context) => const ChatScreen(noChats: false),
    addGroupMembers: (context) => const SampleAddGroupMembersScreen(),
    chatSettings: (context) => const ChatSettings(),
    myDiscussionGroups: (context) => const MyDiscussionGroupsScreen(),
    discoverDiscussionGroups: (context) => const DiscoverDiscussionGroupsScreen(),
    editGroupChat: (context) => const EditGroupChatScreen(),
    finances: (context) => const SampleFinancesScreen(),
    // commentsScreen: (context) => const CommentsScreen(),
    // commentsScreen: (context) => const CommentsScreen(),
    fundraiserScreen: (context) => const SampleFundraiserScreen(),
  };
}
