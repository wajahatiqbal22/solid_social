// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:solid_social/src/app/splash.dart';
import 'package:solid_social/src/app/welcome.dart';
import 'package:solid_social/src/auth/screens/forgotpassword/forgotpassword1.dart';
import 'package:solid_social/src/auth/screens/forgotpassword/forgotpassword2.dart';
import 'package:solid_social/src/auth/screens/forgotpassword/forgotpassword3.dart';
import 'package:solid_social/src/auth/screens/login/login.dart';
import 'package:solid_social/src/auth/screens/signup/signup.dart';
import 'package:solid_social/src/auth/screens/signup/verification.dart';
import 'package:solid_social/src/community/controllers/communities_controller.dart';
import 'package:solid_social/src/community/controllers/create_community_controller.dart';
import 'package:solid_social/src/community/controllers/groups_controller.dart';
import 'package:solid_social/src/community/controllers/join_communities_controller.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/community/screens/add_community.dart';
import 'package:solid_social/src/community/screens/community_settings/colorAndFontsStyle.dart';
import 'package:solid_social/src/community/screens/community_settings/editCommunityNameLogo.dart';
import 'package:solid_social/src/community/screens/community_settings/editCommunityPermissions.dart';
import 'package:solid_social/src/community/screens/community_settings/setCommunityGuidelines.dart';
import 'package:solid_social/src/community/screens/create_community/createCommunity.dart';
import 'package:solid_social/src/community/screens/create_community/inviteCommunityMembers.dart';
import 'package:solid_social/src/community/screens/discussion_groups/add_group_members.dart';
import 'package:solid_social/src/community/screens/discussion_groups/create_discussion_group.dart';
import 'package:solid_social/src/community/screens/discussion_groups/discover_discussion_groups.dart';
import 'package:solid_social/src/community/screens/discussion_groups/group_chat/chat_screen.dart';
import 'package:solid_social/src/community/screens/discussion_groups/group_chat/chat_settings.dart';
import 'package:solid_social/src/community/screens/discussion_groups/group_chat/edit_group_chat.dart';
import 'package:solid_social/src/community/screens/area_of_interest.dart';
import 'package:solid_social/src/community/screens/join_community/success_community_joined.dart';
import 'package:solid_social/src/community/screens/no_communities.dart';
// import 'package:solid_social/src/events/join_events/video_chat_screen.dart';
import 'package:solid_social/src/events/screens/create_events/createEvent.dart';
import 'package:solid_social/src/events/screens/join_events/video_chat_screen.dart';
import 'package:solid_social/src/events/screens/schedule_events.dart';
import 'package:solid_social/src/finances/donate/donate.dart';
import 'package:solid_social/src/finances/finances.dart';
import 'package:solid_social/src/finances/fundraiser.dart';
import 'package:solid_social/src/home/homepage.dart';
import 'package:solid_social/src/home/tabs/timeline/comments_screen.dart';
import 'package:solid_social/src/profile/personalProfile/accountSettings/accountSettingsList.dart';
import 'package:solid_social/src/profile/personalProfile/accountSettings/editInterests.dart';
import 'package:solid_social/src/profile/personalProfile/accountSettings/notificationSettings.dart';
import 'package:solid_social/src/profile/personalProfile/accountSettings/passwordSettings.dart';
import 'package:solid_social/src/profile/personalProfile/accountSettings/personalSettings.dart';
import 'package:solid_social/src/profile/personalProfile/accountSettings/privacySettings.dart';
import 'package:solid_social/src/profile/personalProfile/accountSettings/walletSettings.dart';
import 'package:solid_social/src/profile/personalProfile/editProfile.dart';
import 'package:solid_social/src/profile/personalProfile/personalProfilePage.dart';
import 'package:solid_social/src/profile/profilepage.dart';
import 'package:solid_social/src/shop/viewProduct.dart';

import '../../community/screens/community_settings/communitySettings.dart';
import '../../community/screens/create_community/successCommunityCreated.dart';
import '../../community/screens/join_community/community_notification.dart';
import '../../community/screens/join_community/join_community.dart';
import '../../community/screens/join_community/join_community_list.dart';

class AppRouter {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String verification = '/signup/verification';
  static const String forgotPassword = '/login/forgotPassword';
  static const String otp = '/login/forgotPassword2';
  static const String newPassword = '/login/forgotPassword3';
  static const String feed = '/homepage';
  static const String profilePage = '/profilePage';
  static const String personalProfilePage = '/personalProfilePage';
  static const String addCommunity = '/community/addCommunity';
  static const String createCommunity = '/community/createCommunity';
  static const String inviteCommunityMembers = '/community/inviteCommunityMembers';
  static const String successCreateCommunity = '/community/successCreateCommunity';
  static const String joinCommunity = '/community/joinCommunity';
  static const String areaOfInterest = '/community/areaOfInterest';
  static const String joinCommunityList = '/community/joinCommunityList';
  static const String successJoinedCommunity = '/community/successJoinedCommunity';
  static const String settings = '/community/settings';
  static const String colorAndFontsStyleSettings = '/community/settings/colorAndFontsStyle';
  static const String editCommunityNameLogoSettings = '/community/settings/editCommunityNameLogo';
  static const String setCommunityGuidelinesSettings = '/community/settings/setCommunityGuidelines';
  static const String editCommunityPermissions = '/community/settings/editCommunityPermissions';
  static const String createEvent = '/events/createEvent';
  static const String scheduledEvents = '/events/scheduledEvents';
  static const String create = '/discussionGroups/create';
  static const String addMembers = '/discussionGroups/addMembers';
  static const String noCommunities = '/noCommunities';
  static const String splash = '/';
  static const String chatScreen = '/discussionGroups/chat';
  static const String chatScreenNoChats = '/discussionGroups/noChat';
  static const String discoverDiscussionGroups = '/discussionGroups/discover';
  static const String chatSettings = '/discussionGroups/chat/settings';
  static const String editGroupChat = '/discussionGroups/chat/edit';
  static const String editProfile = '/profilePage/edit';
  static const String accountSettings = '/personalProfilePage/accountSettings';
  static const String personalSettings = '/personalProfilePage/accountSettings/personalSettings';
  static const String walletSettings = '/personalProfilePage/accountSettings/walletSettings';
  static const String editInterests = '/personalProfilePage/accountSettings/editInterests';
  static const String passwordSettings = '/personalProfilePage/accountSettings/passwordSettings';
  static const String privacySettings = '/personalProfilePage/accountSettings/privacySettings';
  static const String notificationSettings =
      '/personalProfilePage/accountSettings/notificationSettings';
  static const String eventVideoChats = '/events/videoChat';
  static const String viewProduct = '/shop/viewProduct';
  static const String commentsScreen = '/timeline/comments_screen';
  static const String finances = '/finances';
  static const String fundraiser = '/finances/fundraiser';
  static const String donate = '/finances/donate';
  static const String communityNotification = '/community/community_notification';

  static Map<String, Widget Function(BuildContext context)> routes = {
    welcome: (context) => const Welcome(),
    login: (context) => LoginScreen(),
    signUp: (context) => SignUpScreen(),
    // verification: (context) => VerificationScreen(),
    forgotPassword: (context) => const ForgotPasswordScreen1(),
    otp: (context) => const ForgotPasswordScreen2(),
    newPassword: (context) => const ForgotPasswordScreen3(),
    feed: (context) => const HomePage(),
    profilePage: (context) => const ProfilePageScreen(),
    personalProfilePage: (context) => const PersonalProfilePageScreen(),
    // addCommunity: (context) => const AddCommunityScreen(),
    // createCommunity: (context) => const CreateCommunityScreen(),
    // inviteCommunityMembers: (context) => const InviteCommunityMembersScreen(),
    successCreateCommunity: (context) => const CommunityCreatedSuccessScreen(),
    // joinCommunity: (context) =>  JoinCommunityScreen(),
    // areaOfInterest: (context) => const AreaOfInterestCommunityScreen(),
    joinCommunityList: (context) => const JoinCommunityListScreen(),
    successJoinedCommunity: (context) => const SuccessCommunityJoinedScreen(),
    settings: (context) => const CommunitySettings(),
    colorAndFontsStyleSettings: (context) => const ColorAndFontsStyleScreen(),
    editCommunityNameLogoSettings: (context) => const EditCommunityNameLogoScreen(),
    setCommunityGuidelinesSettings: (context) => const SetCommunityGuidelinesScreen(),
    // createEvent: (context) => const CreateEventScreen1(),
    // scheduledEvents: (context) => const ScheduledEventsScreen(),
    // create: (context) => const CreateDiscussionGroupScreen(),
    // addMembers: (context) => const AddGroupMembersScreen(),
    editCommunityPermissions: (context) => const EditCommunityPermissionsScreen(),
    // chatScreen: (context) => const ChatScreen(noChats: false),
    // chatScreenNoChats: (context) => const ChatScreen(noChats: true),
    discoverDiscussionGroups: (context) => const DiscoverDiscussionGroupsScreen(),
    chatSettings: (context) => const ChatSettings(),
    // communityNotification: (context) => const CommunityNotificationScreen(),
    // editGroupChat: (context) => const EditGroupChatScreen(),
    // editProfile: (context) => const EditProfileScreen(),
  };

  static Route onGenerateRoute(RouteSettings routeSettings, BuildContext context) {
    switch (routeSettings.name) {
      case feed:
        return MaterialPageRoute(builder: (context) => const HomePage(), settings: routeSettings);
      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen(), settings: routeSettings);
      case signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen(), settings: routeSettings);
      case verification:
        final OtpVerificationArgs args = routeSettings.arguments as OtpVerificationArgs;
        return MaterialPageRoute(
            builder: ((context) => VerificationScreen(args: args)), settings: routeSettings);
      case newPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen3(), settings: routeSettings);
      case profilePage:
        return MaterialPageRoute(
            builder: (context) => const ProfilePageScreen(), settings: routeSettings);
      case addCommunity:
        final controller = routeSettings.arguments as CommunityController;
        return MaterialPageRoute(
            builder: (context) => AddCommunityScreen(controller: controller),
            settings: routeSettings);
      case createCommunity:
        final controller = routeSettings.arguments as CreateCommunityController;
        return MaterialPageRoute(
            builder: (context) => CreateCommunityScreen(controller: controller),
            settings: routeSettings);
      case inviteCommunityMembers:
        final args = routeSettings.arguments as InviteCommunityMembersArgs;
        return MaterialPageRoute(
            builder: (context) => InviteCommunityMembersScreen(args: args),
            settings: routeSettings);
      case successCreateCommunity:
        return MaterialPageRoute(
            builder: (context) => const CommunityCreatedSuccessScreen(), settings: routeSettings);
      case joinCommunity:
        final controller = routeSettings.arguments as JoinCommunityController;
        return MaterialPageRoute(
            builder: (context) => JoinCommunityScreen(controller: controller),
            settings: routeSettings);
      case areaOfInterest:
        return MaterialPageRoute(
            builder: (context) => const AreaOfInterestCommunityScreen(), settings: routeSettings);
      case joinCommunityList:
        return MaterialPageRoute(
            builder: (context) => const JoinCommunityListScreen(), settings: routeSettings);
      case successJoinedCommunity:
        return MaterialPageRoute(
            builder: (context) => const SuccessCommunityJoinedScreen(), settings: routeSettings);
      case settings:
        return MaterialPageRoute(
            builder: (context) => const CommunitySettings(), settings: routeSettings);
      case colorAndFontsStyleSettings:
        return MaterialPageRoute(
            builder: (context) => const ColorAndFontsStyleScreen(), settings: routeSettings);
      case editCommunityNameLogoSettings:
        return MaterialPageRoute(
            builder: (context) => const EditCommunityNameLogoScreen(), settings: routeSettings);
      case setCommunityGuidelinesSettings:
        return MaterialPageRoute(
            builder: (context) => const SetCommunityGuidelinesScreen(), settings: routeSettings);
      case createEvent:
        final selectedCommunity = routeSettings.arguments as Community;
        return MaterialPageRoute(
            builder: (context) => CreateEventScreen1(community: selectedCommunity),
            settings: routeSettings);
      case scheduledEvents:
        final args = routeSettings.arguments as ScheduledEventsArgs;
        return MaterialPageRoute(
            builder: (context) => ScheduledEventsScreen(args: args), settings: routeSettings);
      case create:
        final controller = routeSettings.arguments as GroupsController;
        return MaterialPageRoute(
            builder: (context) => CreateDiscussionGroupScreen(controller: controller),
            settings: routeSettings);
      case addMembers:
        final args = routeSettings.arguments as AddGroupMembersArgs;
        return MaterialPageRoute(
            builder: (context) => AddGroupMembersScreen(args: args), settings: routeSettings);
      case editCommunityPermissions:
        return MaterialPageRoute(
            builder: (context) => const EditCommunityPermissionsScreen(), settings: routeSettings);
      case welcome:
        return MaterialPageRoute(builder: (context) => const Welcome(), settings: routeSettings);
      case noCommunities:
        return MaterialPageRoute(builder: (context) => const NoCommunities());
      case chatScreen:
        final ChatArgs args = routeSettings.arguments as ChatArgs;
        return MaterialPageRoute(
            builder: (context) => ChatScreen(args: args), settings: routeSettings);
      // case chatScreenNoChats:
      //   final ChatArgs args = routeSettings.arguments as ChatArgs;
      //   return MaterialPageRoute(
      //       builder: (context) => ChatScreen(noChats: true, args: args), settings: routeSettings);
      case discoverDiscussionGroups:
        return MaterialPageRoute(
            builder: (context) => const DiscoverDiscussionGroupsScreen(), settings: routeSettings);
      case chatSettings:
        return MaterialPageRoute(
            builder: (context) => const ChatSettings(), settings: routeSettings);
      case editGroupChat:
        final args = routeSettings.arguments as EditGroupChatArgs;
        return MaterialPageRoute(
            builder: (context) => EditGroupChatScreen(args: args), settings: routeSettings);
      case editProfile:
        return MaterialPageRoute(
            builder: (context) => const EditProfileScreen(), settings: routeSettings);
      case accountSettings:
        return MaterialPageRoute(
            builder: (context) => const AccountSettingsScreen(), settings: routeSettings);
      case personalSettings:
        return MaterialPageRoute(
            builder: (context) => const PersonalSettingsScreen(), settings: routeSettings);
      case walletSettings:
        return MaterialPageRoute(builder: (context) => const WalletSettingsScreen());
      case editInterests:
        return MaterialPageRoute(
            builder: (context) => const EditInterestsScreen(), settings: routeSettings);
      case passwordSettings:
        return MaterialPageRoute(
            builder: (context) => const PasswordSettingsScreen(), settings: routeSettings);
      case privacySettings:
        return MaterialPageRoute(
            builder: (context) => const PrivacySettingsScreen(), settings: routeSettings);
      case notificationSettings:
        return MaterialPageRoute(
            builder: (context) => const NotificationSettingsScreen(), settings: routeSettings);
      case eventVideoChats:
        final VideoChatScreenArgs args = routeSettings.arguments as VideoChatScreenArgs;
        return MaterialPageRoute(
            builder: (context) => VideoChatScreen(
                  args: args,
                ),
            settings: routeSettings);
      case viewProduct:
        return MaterialPageRoute(
            builder: (context) => const ViewProductScreen(), settings: routeSettings);
      case commentsScreen:
        final args = routeSettings.arguments as CommentsScreenArgs;
        return MaterialPageRoute(builder: (context) => CommentsScreen(args: args));

      case finances:
        return MaterialPageRoute(
            builder: (context) => const FinancesScreen(), settings: routeSettings);
      case fundraiser:
        return MaterialPageRoute(
            builder: (context) => const FundraiserScreen(), settings: routeSettings);
      case donate:
        return MaterialPageRoute(
            builder: (context) => const DonateScreen(), settings: routeSettings);
      case communityNotification:
        final controller = routeSettings.arguments as JoinCommunityController;
        return MaterialPageRoute(
            builder: (context) => CommunityNotificationScreen(joinCommunityController: controller),
            settings: routeSettings);
      default:
        return MaterialPageRoute(builder: (context) => const Splash(), settings: routeSettings);
    }
  }
}
