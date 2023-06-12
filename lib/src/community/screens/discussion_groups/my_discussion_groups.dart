// Dart imports:
// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/extensions/list_extensions.dart';
import 'package:solid_social/src/app/bootstrap/stream_chat_controller/stream_chat_controller.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/community/controllers/groups_controller.dart';
import 'package:solid_social/src/community/screens/discussion_groups/group_chat/chat_screen.dart';
import 'package:solid_social/src/home/controllers/home_controller.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MyDiscussionGroupsScreen extends StatefulWidget {
  const MyDiscussionGroupsScreen({Key? key, required this.controller}) : super(key: key);

  final GroupsController? controller;

  @override
  State<MyDiscussionGroupsScreen> createState() => _MyDiscussionGroupsScreenState();
}

class _MyDiscussionGroupsScreenState extends State<MyDiscussionGroupsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.controller?.getCommunityGroups();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return context.select<HomeController, GroupsController?>((con) => con.groupsController) == null
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ChangeNotifierProvider.value(
              value: context.read<HomeController>().groupsController,
              child: Builder(builder: (context) {
                final controller = context.read<GroupsController>();
                final state = context.select((GroupsController? con) => con?.state);
                return state == Loading.processing
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : Builder(builder: (context) {
                        final data = context.select((StreamChatController value) => value.state).maybeWhen(
                          orElse: () {
                            return const SizedBox();
                          },
                          connecting: () {
                            return const CircularProgressIndicator.adaptive();
                          },
                          connectedUser: (user) {
                            return Scaffold(
                              appBar: AppBar(
                                automaticallyImplyLeading: false,
                                title: const HeadingText5(
                                  text: "My Discussion Groups",
                                  fontWeight: FontWeight.w700,
                                ),
                                elevation: 0,
                                actions: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, AppRouter.discoverDiscussionGroups);
                                      },
                                      icon: CustomIcons.plus()),
                                ],
                              ),
                              body: StreamChannelListView(
                                controller: StreamChannelListController(
                                  client: controller.services.chatClient.client,
                                  presence: true,
                                  limit: 15,
                                  filter: Filter.and([
                                    Filter.in_('members', [
                                      if (StreamChat.of(context).currentUser != null)
                                        StreamChat.of(context).currentUser!.id
                                    ]),
                                    if (context.read<HomeController>().selectedCommunity != null)
                                      Filter.equal("communityId", context.read<HomeController>().selectedCommunity!.id!)
                                  ]),
                                ),
                                itemBuilder: (context, channels, index, tile) {
                                  final channel = channels[index];
                                  final Map<String, dynamic> extraData =
                                      Map<String, dynamic>.from(channel.extraData)["groupData"];

                                  return _DiscussionGroupItem(
                                      groupTitle: extraData["groupName"] ?? "",
                                      imageUrl: extraData["displayPhotoUrl"] as String?,
                                      title: extraData["groupName"] ?? "",
                                      excerpt: channel.state?.lastMessage?.text ?? "${channel.createdAt}",
                                      notificationNumber: channel.state?.unreadCount ?? 0,
                                      onPressed: () {
                                        final group = context.read<GroupsController>().communityGroups.firstWhereOrNull(
                                            (element) => element.id == channel.id,
                                            orElse: () => null);
                                        context.toNamed(AppRouter.chatScreen,
                                            arguments: ChatArgs(channel: channel, group: group));
                                      });
                                },
                                separatorBuilder: (context, channels, index) {
                                  return _divider();
                                },
                                emptyBuilder: (context) {
                                  return const Center(child: Text("No Channels"));
                                },
                              ),
                            );
                          },
                        );

                        return data;

                        // return widget ?? const SizedBox();
                      });
              }),
            );
    });
  }

  Widget _divider() {
    return const Divider(
      color: CustomColors.grey25Black,
      height: 25,
      thickness: 0.5,
    );
  }
}

class _DiscussionGroupItem extends StatelessWidget {
  const _DiscussionGroupItem({
    super.key,
    this.imageUrl,
    required this.groupTitle,
    required this.title,
    required this.excerpt,
    required this.onPressed,
    this.notificationNumber = 0,
  });

  final String? imageUrl;
  final String title;
  final String excerpt;
  final String groupTitle;
  final Function() onPressed;
  final int notificationNumber;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(
            left: CustomGlobal.paddingInline / 2,
            right: CustomGlobal.paddingInline / 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      imageUrl == null
                          ? CircularNameInitials(name: groupTitle, radius: 25)
                          : CircularNetworkImage(imageUrl: imageUrl, size: 25),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: title,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                            const SizedBox(height: 5),
                            InterText(
                              text: excerpt,
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (notificationNumber > 0)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 32,
                    minWidth: 43,
                  ),
                  child: Center(
                    child: InterText(
                      text: notificationNumber > 9 ? "9+" : "$notificationNumber",
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
