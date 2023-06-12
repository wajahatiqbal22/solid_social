// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/shared/entities/emoji/emoji.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/home/domain/controller/timeline_controller.dart';
import 'package:solid_social/src/home/tabs/timeline/comments_screen.dart';
import 'package:solid_social/src/home/tabs/timeline/widgets/sheets.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/posts.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:timeago/timeago.dart';

import '../../../../app/router/routes.dart';

class Feed extends StatefulWidget {
  const Feed({super.key, required this.controller});

  final TimelineController controller;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with AutomaticKeepAliveClientMixin {
  final pagekey = const PageStorageKey("communities_timeline");

  bool isInitialized = false;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  _initialize() async {
    final state = await widget.controller.currentChannel.watch();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isInitialized = true;
      });
      widget.controller.listenToChannel(widget.controller.currentChannel);
      widget.controller.fetchStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.controller,
      child: Builder(builder: (context) {
        return !isInitialized
            ? const Center(child: CircularProgressIndicator.adaptive())
            : StreamChannel(
                channel: widget.controller.currentChannel,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CustomColors.grey25Black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              top: 10,
                            ),
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: () async {
                                    final option = await showAttachmentTypeSheet(context);
                                    if (option != null) {
                                      final source = await showImageSourceSheet(context);
                                      if (source != null) {
                                        final file = option == AttachmentType.image
                                            ? await ImagePicker().pickImage(source: source, imageQuality: 30)
                                            : await ImagePicker()
                                                .pickVideo(source: source, maxDuration: const Duration(seconds: 30));
                                        log("Image picker: $file");
                                        if (file != null) {
                                          final attachment = File(file.path);
                                          await widget.controller
                                              .sendMessage(body: "", type: PostType.story, attachment: attachment);
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFe9eaec),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 33,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  width: 75,
                                  child: const Align(
                                    child: Text(
                                      "Your Story",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Builder(builder: (context) {
                              final controller = context.read<TimelineController>();
                              final userstories = controller.userStories;
                              context.select((TimelineController value) => value.storiesState);
                              return controller.storiesState == Loading.processing
                                  ? const Center(child: CircularProgressIndicator.adaptive())
                                  : ListView.builder(
                                      itemCount: userstories.entries.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) {
                                        final story = userstories.entries.toList()[index];
                                        // return const SizedBox();

                                        return StoryPlayerWrapper(
                                          userStory: story.value,
                                          onPlay: () {
                                            context.to(StoryPlayer(story: story.value));
                                          },
                                        );
                                      },
                                    );
                            }),
                          ),
                        ],
                      ),
                      //  SingleChildScrollView(
                      //   key: const PageStorageKey("timelineBarView"),
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: [
                      //       stories(DummyProvider.storyList),
                      //     ],
                      //   ),
                      // ),
                    ),

                    Expanded(
                      child: StreamMessageListView(
                        highlightInitialMessage: true,
                        showConnectionStateTile: true,
                        reverse: false,
                        headerBuilder: (context) {
                          return const SizedBox();
                        },
                        key: pagekey,
                        dateDividerBuilder: (time) {
                          return const SizedBox();
                        },
                        loadingBuilder: (context) {
                          return TimelineLoading();
                        },
                        messageFilter: (message) {
                          return message.extraData["postType"] == PostType.post.name;
                        },
                        messageBuilder: (context, details, messages, messageWidget) {
                          final localEmojis = context.read<Bootstrap>().emojisMap;
                          List<Emoji> reactions = [];
                          List<EmojiButton> reactionButtons = [];
                          final scores = details.message.reactionScores;
                          reactionButtons = scores?.entries
                                  .map((e) => EmojiButton(
                                      reactionCount: e.value,
                                      emojiIcon: Text(localEmojis[e.key],
                                          style: const TextStyle(fontSize: 22, color: Colors.red))))
                                  .toList() ??
                              [];
                          // if (details.message.latestReactions != null) {
                          //   reactions = details.message.latestReactions!
                          //       .map((e) => Emoji(
                          //           code: e.type,
                          //           emoji:
                          //               (e.extraData["emoji"] ?? e.extraData["icon"]).toString()))
                          //       .toList();
                          // }

                          bool isLocal = false;
                          if (details.message.attachments.isNotEmpty) {
                            if (details.message.attachments.first.file != null) {
                              isLocal = !isLocal;
                            }
                          }
                          List<Object> attachments = [];
                          if (details.message.attachments.isNotEmpty) {
                            if (details.message.attachments.first.file != null) {
                              attachments.add(File(details.message.attachments.first.file!.path!));
                            } else {
                              attachments.add(details.message.attachments.first.imageUrl!);
                            }
                          }
                          return PostItem(
                            profilePicture: details.message.user?.image,
                            username: details.message.user?.name ?? "",
                            timeUpdated: format(details.message.createdAt),
                            caption: details.message.text,
                            emojiItems: reactionButtons,
                            commentCount: details.message.replyCount ?? 0,
                            onCommentsTapped: () {
                              context.toNamed(
                                AppRouter.commentsScreen,
                                arguments: CommentsScreenArgs(
                                  channel: widget.controller.currentChannel,
                                  controller: widget.controller,
                                  parentMessage: details.message,
                                ),
                              );
                            },
                            onEmojiTapped: (emoji) async {
                              await widget.controller.addReaction(details.message, emoji);
                            },
                            attachments: attachments,
                          );
                        },
                        // children: [
                        //   const PostItem(
                        //     profilePicture: 'assets/sample_images/avatars/avatar2.png',
                        //     username: 'JamesJ',
                        //     timeUpdated: '30min',
                        //     caption:
                        //         'Hello everyone on the community, I’m so happy to be here with y’all. I’m James, a Fashion Designer...',
                        //     attachments: ["assets/sample_images/image1.png"],
                        //   ),
                        //   PostItem(
                        //     profilePicture: 'assets/sample_images/avatars/avatar3.png',
                        //     username: 'Jasmine',
                        //     timeUpdated: '45min',
                        //     caption:
                        //         'Hello everyone on the community, I’m so happy to be here with y’all.',
                        //     commentCount: 16,
                        //     emojiItems: [
                        //       EmojiButton(
                        //         reactionCount: 2,
                        // emojiIcon: CustomEmoji.heart(),
                        //         active: true,
                        //       ),
                        //       EmojiButton(
                        //         reactionCount: 2,
                        //         emojiIcon: CustomEmoji.handWave(),
                        //       ),
                        //       EmojiButton(
                        //         reactionCount: 5,
                        //         emojiIcon: CustomEmoji.huggingFace(),
                        //       ),
                        //     ],
                        //   ),
                        //   PostItem(
                        //     username: 'Tasboy',
                        //     profilePicture: 'assets/sample_images/avatars/avatar4.png',
                        //     caption:
                        //         'Hi Guys, I’m super stocked to announce that I just became the latest Gucci Brand Ambassador',
                        //     timeUpdated: '48min',
                        //     commentCount: 69,
                        //     emojiItems: [
                        //       EmojiButton(
                        //         emojiIcon: CustomEmoji.fire(),
                        //         reactionCount: 200,
                        //         active: true,
                        //       ),
                        //       EmojiButton(
                        //         reactionCount: 120,
                        //         emojiIcon: CustomEmoji.partyHat(),
                        //       ),
                        //     ],
                        //   ),
                        //   PostItem(
                        //     username: 'Clara',
                        //     profilePicture: 'assets/sample_images/avatars/avatar5.png',
                        //     caption:
                        //         'Lagos Fashion Week in a bit guys, I can’t wait to experience this again💃',
                        //     timeUpdated: '48min',
                        //     commentCount: 16,
                        //     emojiItems: [
                        //       EmojiButton(
                        //         reactionCount: 8,
                        //         emojiIcon: CustomEmoji.like(),
                        //       ),
                        //       EmojiButton(
                        //         reactionCount: 2,
                        //         emojiIcon: CustomEmoji.handsUp(),
                        //       ),
                        //       EmojiButton(
                        //         reactionCount: 7,
                        //         emojiIcon: CustomEmoji.huggingFace(),
                        //       ),
                        //       EmojiButton(
                        //         reactionCount: 6,
                        //         emojiIcon: CustomEmoji.heart(),
                        //         active: true,
                        //       ),
                        //       EmojiButton(
                        //         reactionCount: 5,
                        //         emojiIcon: CustomEmoji.girlDance(),
                        //       ),
                        //       EmojiButton(
                        //         reactionCount: 3,
                        //         emojiIcon: CustomEmoji.boyDance(),
                        //         active: true,
                        //       ),
                        //       EmojiButton(
                        //         reactionCount: 2,
                        //         emojiIcon: CustomEmoji.smileyBlushFace(),
                        //       ),
                        //     ],
                        //   ),
                        //   PostItem(
                        //     username: 'Takumi Fujiwara',
                        //     profilePicture: 'assets/sample_images/avatars/avatar7.png',
                        //     caption: 'Ahh yes',
                        //     timeUpdated: '1hour',
                        //     commentCount: 501,
                        //     emojiItems: [
                        //       EmojiButton(
                        //         reactionCount: 2000,
                        //         emojiIcon: CustomEmoji.nerd(),
                        //         active: true,
                        //       )
                        //     ],
                        //   ),
                        //   const PostItem(
                        //     username: 'JamesJ',
                        //     profilePicture: 'assets/sample_images/avatars/avatar2.png',
                        //     caption:
                        //         'Hello Everyone! This is my first post! I\'m so excited to meet all of you guys!',
                        //     timeUpdated: '2hours',
                        //     commentCount: 2,
                        //   ),
                        // ],
                      ),
                    ),
                    // StreamMessageInput()
                  ],
                ),
              );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TimelineLoading extends StatelessWidget {
  const TimelineLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber, height: 200, width: 200);
  }
}

class StoryPlayerWrapper extends StatelessWidget {
  const StoryPlayerWrapper({
    Key? key,
    required this.userStory,
    required this.onPlay,
  }) : super(key: key);

  final UserStory userStory;
  final Function() onPlay;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPlay,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
          top: 10,
        ),
        child: Column(
          children: <Widget>[
            // image box
            SizedBox(
              width: 56,
              height: 56,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(userStory.user.image ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  userStory.user.online
                      ? Positioned(
                          top: 38,
                          left: 40,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              width: 75,
              child: Align(
                child: Text(
                  userStory.user.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StoryPlayer extends StatefulWidget {
  const StoryPlayer({super.key, required this.story});

  final UserStory story;

  @override
  State<StoryPlayer> createState() => _StoryPlayerState();
}

class _StoryPlayerState extends State<StoryPlayer> {
  late final StoryController storyController = StoryController();

  @override
  void didChangeDependencies() {
    for (final story in widget.story.stories) {
      if (story.attachments.isNotEmpty) {
        precacheImage(NetworkImage(story.attachments.first.imageUrl ?? ""), context);
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: context.height * 0.03),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: context.pop,
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: StoryView(
                  onComplete: context.pop,
                  storyItems: widget.story.stories.map((e) {
                    final attachment = e.attachments.first;
                    if (attachment.mimeType == MimeType.imageJpeg) {
                      return StoryItem.pageImage(url: attachment.imageUrl!, controller: storyController);
                    } else if (attachment.mimeType == MimeType.videoMp4) {
                      return StoryItem.pageVideo(attachment.assetUrl!, controller: storyController);
                    } else {
                      return StoryItem.text(title: e.text ?? "", backgroundColor: Colors.black);
                    }
                  }).toList(),
                  controller: storyController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum AttachmentType { image, video }

class MimeType {
  static const String imageJpeg = 'image/jpeg';
  static const String videoMp4 = 'video/mp4';
}
