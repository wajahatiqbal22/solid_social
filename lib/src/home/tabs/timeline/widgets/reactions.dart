// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/extensions/iterable_extensions.dart';
import 'package:solid_social/shared/entities/emoji/emoji.dart';
import 'package:solid_social/src/home/tabs/timeline/widgets/animation_wrap.dart';

class AddReactionButton extends StatefulWidget {
  const AddReactionButton({
    super.key,
    required this.onTap,
    required this.focusScopeNode,
    required this.isSentByMe,
    required this.reactionSelections,
    required this.onEmojiTapped,
    // required this.message,
    // required this.controller,
  });

  final VoidCallback onTap;
  final FocusScopeNode focusScopeNode;
  final bool isSentByMe;
  final List<Emoji> reactionSelections;
  final Function(Emoji) onEmojiTapped;
  // final Message message;
  // final TimelineController controller;

  @override
  State<AddReactionButton> createState() => AddReactionButtonState();
}

class AddReactionButtonState extends State<AddReactionButton> {
  final double _heightReactionIcon = 27;
  OverlayEntry? _overlayEntry;
  final LayerLink layerLink = LayerLink();

  @override
  void initState() {
    widget.focusScopeNode.addListener(() {
      if (widget.focusScopeNode.hasFocus) {
        _showReactionsOverlay();
      } else {
        _removeReactionsOverlay();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _removeReactionsOverlay();
    super.dispose();
  }

  _removeReactionsOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showReactionsOverlay() {
    if (!mounted) return;
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    _overlayEntry = _getOverlayEntry(offset, size);

    overlay?.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: FocusScope.withExternalFocusNode(
        focusScopeNode: widget.focusScopeNode,
        autofocus: false,
        onFocusChange: (value) {},
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          shadowColor: Colors.black.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: _heightReactionIcon,
              width: 32.0,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset("assets/custom_icons/emoji+.svg"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static const double REACTIONS_CARD_WIDTH = 300.0;

  OverlayEntry _getOverlayEntry(Offset offset, Size size) {
    /// Here we calculate if there is space of the [OverlayEntry] for the device to positioned correctly
    final availableSpaceWidth = widget.isSentByMe ? offset.dx : (context.width - offset.dx);
    var dxExceededDevice = REACTIONS_CARD_WIDTH - availableSpaceWidth;
    dxExceededDevice = dxExceededDevice < 0 ? 0.0 : dxExceededDevice;
    final dCardWidthDevice = context.width - REACTIONS_CARD_WIDTH;
    final paddingH = dCardWidthDevice.clamp(0.0, 16.0);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,

          /// we positioned [OverlayEntry] from [Offset.zero] of [CompositedTransformTarget]
          offset: widget.isSentByMe

              ///  then we reduce [AppDimens.REACTIONS_CARD_WIDTH] the size of card AND
              ///  [dxExceededDevice] the size after the device from right (16 px of padding)
              ? Offset(-(REACTIONS_CARD_WIDTH - (dxExceededDevice + paddingH)), -16.0)

              ///  then we reduce dxExceededDevice that is the size after the device from right (16 px of padding)
              : Offset(-(dxExceededDevice + paddingH), 20),
          child: _ReactionsPopUp(
            reactionSelections: widget.reactionSelections,
            onEmojiTapped: widget.onEmojiTapped,
            // message: widget.message,
            // controller: widget.controller,
            focusScopeNode: widget.focusScopeNode,
          ),
        ),
      ),
    );
  }
}

class _ReactionsPopUp extends StatelessWidget {
  const _ReactionsPopUp({
    super.key,
    required this.reactionSelections,
    required this.focusScopeNode,
    required this.onEmojiTapped,
  });

  final List<Emoji> reactionSelections;
  final Function(Emoji) onEmojiTapped;

  // final Message message;
  // final TimelineController controller;
  final FocusScopeNode focusScopeNode;
  final visibleReactions = 6;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Here we override onTap so [GestureDetector] on main.dart will not trigger the unFocus
      onTap: () => null,
      child: AnimWrap.all(
        scale: 0.0,
        opacity: 1.0,
        yOffset: 120,
        duration: const Duration(milliseconds: 300),
        //curve: Curves.easeInOutExpo,
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          shadowColor: Colors.black.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Material(
            color: Colors.transparent,
            child: Container(
              /// the width is controlled with OverlayEntry
              height: 48.0,
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  ...reactionSelections.take(visibleReactions).mapIndexed(
                        (index, reaction) => Flexible(
                          child: _SelectReactionEmoji(
                            reaction: reaction,
                            animOrder: index + 1,
                            onTap: () {
                              onEmojiTapped(reaction);
                              focusScopeNode.unfocus();
                              // ADD REACTION
                              // controller.onReactionAdded(
                              //     messageId: message.id, reactionId: reaction.id);
                            },
                          ),
                        ),
                      ),
                  /*Flexible(
                      child: _SelectReactionAddMore(
                    visibleReactions: visibleReactions,
                    onTap: () => null,
                  )),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectReactionEmoji extends StatelessWidget {
  const _SelectReactionEmoji({
    super.key,
    required this.reaction,
    this.onTap,
    this.animOrder = 1,
  });

  final Emoji reaction;
  final VoidCallback? onTap;
  final int animOrder;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: Alignment.center,
          child: AnimWrap.all(
              delay: Duration(milliseconds: animOrder * 80),
              angle: 2.0,
              scale: 0.0,
              xOffset: 100,
              yOffset: 100,
              curve: Curves.easeInOutExpo,
              child: Text(
                reaction.emoji,
                style: context.textTheme.headline5,
              )),
        ),
      ),
    );
  }
}

class _SelectReactionAddMore extends StatelessWidget {
  const _SelectReactionAddMore({
    super.key,
    this.onTap,
    required this.visibleReactions,
  });
  final VoidCallback? onTap;
  final int visibleReactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: Alignment.center,
          child: AnimWrap.all(
            delay: Duration(milliseconds: (visibleReactions + 1) * 80),
            angle: 2.0,
            scale: 0.0,
            xOffset: 100,
            yOffset: 100,
            curve: Curves.easeInOutExpo,
            child: Container(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFEAEAED)),
              child: const Icon(
                Icons.add,
                color: Color(0xFF6F6F71),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
