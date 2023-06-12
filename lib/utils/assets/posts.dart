// Flutter imports:
import 'dart:io';

import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/shared/entities/emoji/emoji.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/home/tabs/timeline/widgets/reactions.dart';
import 'package:solid_social/utils/assets/buttons.dart';
// Project imports:
import 'package:solid_social/utils/assets/textstyles.dart';

import 'colors.dart';
import 'images.dart';

double _profilePictureSize = 42;
double _contentProfilePictureSpacing = 10;
double _postPaddingInline = 20;

class PostItem extends StatelessWidget {
  final String? profilePicture;
  final String username;
  final String timeUpdated;
  final String? caption;
  final int commentCount;
  final List<Object> attachments;
  final List<EmojiButton> emojiItems;
  final Function(Emoji) onEmojiTapped;
  final Function()? onCommentsTapped;
  const PostItem({
    super.key,
    this.profilePicture,
    required this.username,
    required this.timeUpdated,
    required this.onEmojiTapped,
    this.caption,
    this.commentCount = 0,
    this.attachments = const [],
    this.emojiItems = const [],
    this.onCommentsTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: _postPaddingInline,
        right: _postPaddingInline,
        bottom: 15,
        top: 15,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CustomColors.grey25Black,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              profilePicture == null
                  ? CircularNameInitials(name: username, fontSize: 18)
                  : ProfilePictureSection(
                      url: profilePicture!,
                    ),
              ContentSection(
                username: username,
                content: caption,
                time: timeUpdated,
                attachments: attachments,
              ),
            ],
          ),
          BottomActionSection(
            onCommentsTapped: onCommentsTapped,
            onEmojiTapped: onEmojiTapped,
            commentCount: commentCount,
            emojiItems: emojiItems,
          ),
        ],
      ),
    );
  }
}

class ReplyItem extends StatelessWidget {
  final String profilePicture;
  final String username;
  final String timeUpdated;
  final String? caption;
  final int commentCount;
  final List<String> attachments;
  final List<EmojiButton> emojiItems;

  // replies
  final String repliedTo;
  final String repliedToProfilePicture;
  final String repliedCaption;
  final int repliedCommentCount;
  final List<EmojiButton> repliedEmojiItems;
  final List<String> repliedAttachments;
  final Function(Emoji) onEmojiTapped;

  const ReplyItem({
    super.key,
    required this.profilePicture,
    required this.username,
    required this.timeUpdated,
    this.caption,
    this.commentCount = 0,
    this.attachments = const [],
    this.emojiItems = const [],
    required this.repliedTo,
    required this.repliedToProfilePicture,
    this.repliedCaption = "",
    this.repliedCommentCount = 0,
    this.repliedEmojiItems = const [],
    required this.onEmojiTapped,
    this.repliedAttachments = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        left: _postPaddingInline,
        right: _postPaddingInline,
        bottom: 15,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CustomColors.grey25Black,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfilePictureSection(
                url: profilePicture,
              ),
              ContentSection(
                username: username,
                content: caption,
                time: timeUpdated,
                attachments: attachments,
                repliedTo: repliedTo,
              ),
            ],
          ),
          BottomActionSection(
            commentCount: commentCount,
            onEmojiTapped: onEmojiTapped,
            emojiItems: emojiItems,
          ),
          Container(
            margin: EdgeInsets.only(left: _profilePictureSize + _contentProfilePictureSpacing, top: 15),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: const Border.fromBorderSide(BorderSide(color: CustomColors.grey25Black, width: 0.5)),
            ),
            // REPLIES
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfilePictureSection(
                      url: repliedToProfilePicture,
                    ),
                    ContentSection(
                      username: repliedTo,
                      content: repliedCaption,
                      attachments: repliedAttachments,
                    ),
                  ],
                ),
                BottomActionSection(
                  onEmojiTapped: onEmojiTapped,
                  commentCount: repliedCommentCount,
                  emojiItems: repliedEmojiItems,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfilePictureSection extends StatelessWidget {
  final String url;
  const ProfilePictureSection({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ProfilePictureImage(
      asset: url,
      width: _profilePictureSize,
      height: _profilePictureSize,
    );
  }
}

class ContentSection extends StatelessWidget {
  final String? content;
  final String username;
  final String time;
  final List<Object> attachments;
  final String repliedTo;
  const ContentSection({
    super.key,
    this.content,
    required this.username,
    this.time = "",
    this.attachments = const [],
    this.repliedTo = "",
  });

  /// main widget of ContentSection
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  left: _contentProfilePictureSpacing,
                  right: 5,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profilePage');
                  },
                  child: HeadingText5(
                    text: username,
                    color: Colors.black,
                  ),
                ),
              ),
              if (repliedTo.isNotEmpty)
                Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      right: 5,
                    ),
                    child: Row(
                      children: [
                        const InterText(
                          text: "Replied to ",
                          color: CustomColors.grey75,
                          fontSize: 12,
                        ),
                        InterText(
                          text: "@$repliedTo",
                        )
                      ],
                    )),
              if (time.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: InterText(
                    text: time,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.grey75,
                  ),
                ),
              const Expanded(
                child: ActionSection(),
              ),
            ],
          ),
          Row(
            children: [
              if (content != null && content!.isNotEmpty)
                Flexible(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: _contentProfilePictureSpacing,
                      top: 10,
                      bottom: 9,
                    ),
                    child: InterText(
                      text: content!,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                )
              else
                const SizedBox(height: 10),
            ],
          ),
          if (attachments.isNotEmpty)
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: double.infinity,
                        child: attachments.first is File
                            ? Image.file(
                                attachments[0] as File,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                attachments[0] as String,
                                fit: BoxFit.cover,
                                height: context.height * 0.25,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[200]!,
                                    child: const SizedBox(height: 300, width: double.infinity),
                                  );
                                },
                                // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                //   log("$wasSynchronouslyLoaded");
                                //   log("frame: $frame");
                                //   return Shimmer.fromColors(
                                //     baseColor: Colors.grey[300]!,
                                //     highlightColor: Colors.grey[200]!,
                                //     child: child,
                                //   );
                                // },
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  /// <h3>This contains the username and the time updated</h3>

  /// <h3>This is the content of the post</h3>

  /// <h3>This is the attachments content of the post</h3>

}

class ActionSection extends StatelessWidget {
  const ActionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: 23,
        width: 50,
        child: IconButton(
          padding: const EdgeInsets.all(0),
          icon: SvgPicture.asset("assets/custom_icons/post_options.svg"),
          onPressed: () {},
        ),
      ),
    );
  }
}

class BottomActionSection extends StatefulWidget {
  final int? commentCount;
  final int? replyCount;
  final List<EmojiButton> emojiItems;
  final Function(Emoji) onEmojiTapped;
  final Function()? onCommentsTapped;
  const BottomActionSection({
    super.key,
    this.commentCount,
    this.replyCount,
    required this.onEmojiTapped,
    this.onCommentsTapped,
    this.emojiItems = const [],
  }) : assert((commentCount != null && replyCount == null) || (replyCount != null && commentCount == null));

  @override
  State<BottomActionSection> createState() => _BottomActionSectionState();
}

class _BottomActionSectionState extends State<BottomActionSection> {
  final FocusScopeNode node = FocusScopeNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: _profilePictureSize + _contentProfilePictureSpacing,
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        spacing: 8,
        runSpacing: 10,
        children: [
          CommentsButton(
            onTap: widget.onCommentsTapped,
            replyCount: widget.replyCount,
            commentCount: widget.commentCount,
          ),
          for (var emojiItem in widget.emojiItems) emojiItem,
          AddReactionButton(
            focusScopeNode: node,
            isSentByMe: false,
            onTap: () {
              node.requestFocus();
            },
            onEmojiTapped: widget.onEmojiTapped,
            reactionSelections: context.read<Bootstrap>().getEmojis().sublist(0, 5),
          )
        ],
      ),
    );
  }

  final double minCommentButtonWidth = 45;

  final double minCommentButtonHeight = 30;

  Widget commentsButton() {
    return Container(
      height: minCommentButtonHeight,
      padding: const EdgeInsets.only(
        right: 8,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: minCommentButtonHeight,
          maxHeight: minCommentButtonHeight,
          minWidth: minCommentButtonWidth,
        ),
        child: OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            side: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            minimumSize: Size(minCommentButtonWidth, minCommentButtonHeight),
          ),
          icon: SvgPicture.asset(
            "assets/custom_icons/comment.svg",
          ),
          label: PostContentText(
            text: widget.commentCount! > 0
                ? widget.commentCount! > 500
                    ? "500+ Comments"
                    : "${widget.commentCount} Comments"
                : "Comment",
          ),
        ),
      ),
    );
  }
}

class EmojiButton extends StatelessWidget {
  final int reactionCount;
  final dynamic emojiIcon;
  final bool active;
  const EmojiButton({
    Key? key,
    required this.reactionCount,
    required this.emojiIcon,
    this.active = false,
  }) : super(key: key);

  final double _minEmojiButtonWidth = 35;
  final double _minEmojiButtonHeight = 30;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: _minEmojiButtonHeight,
        minWidth: _minEmojiButtonWidth,
        maxHeight: _minEmojiButtonHeight,
      ),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 0,
          ),
          side: BorderSide(
            color: active ? CustomColors.blue : CustomColors.grey25Black,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          minimumSize: Size(
            _minEmojiButtonWidth,
            _minEmojiButtonHeight,
          ),
          alignment: Alignment.centerLeft,
          backgroundColor: active ? CustomColors.blue50 : Colors.transparent,
        ),
        child: Wrap(
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 3,
          children: [
            emojiIcon,
            InterText(
              text: reactionCount < 1000 ? "+$reactionCount" : "+${(reactionCount / 1000).floor()}k",
            ),
          ],
        ),
      ),
    );
  }
}

class AddEmojiButton extends StatelessWidget {
  const AddEmojiButton({Key? key, this.onPressed}) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    const double minEmojiButtonWidth = 25;
    const double minEmojiButtonHeight = 30;
    return IconButton(
      constraints: const BoxConstraints(
        minHeight: minEmojiButtonHeight,
        minWidth: minEmojiButtonWidth,
        maxHeight: minEmojiButtonHeight,
      ),
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      onPressed: onPressed,
      icon: SvgPicture.asset("assets/custom_icons/emoji+.svg"),
    );
  }
}

class CommentsItem extends StatelessWidget {
  final String? profilePicture;
  final String username;
  final String timeUpdated;
  final String? caption;
  final int replyCount;
  final List<String> attachments;
  final List<EmojiButton> emojiItems;
  final Function(Emoji) onEmojiTapped;
  const CommentsItem({
    super.key,
    this.profilePicture,
    required this.username,
    required this.timeUpdated,
    required this.onEmojiTapped,
    this.caption,
    this.replyCount = 0,
    this.attachments = const [],
    this.emojiItems = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: _postPaddingInline, right: _postPaddingInline, bottom: 15, top: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CustomColors.grey25Black,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              profilePicture == null
                  ? CircularNameInitials(name: username, fontSize: 18)
                  : ProfilePictureSection(
                      url: profilePicture!,
                    ),
              ContentSection(
                username: username,
                content: caption,
                time: timeUpdated,
                attachments: attachments,
              ),
            ],
          ),
          BottomActionSection(
            onEmojiTapped: onEmojiTapped,
            replyCount: replyCount,
            emojiItems: emojiItems,
          ),
        ],
      ),
    );
  }
}
