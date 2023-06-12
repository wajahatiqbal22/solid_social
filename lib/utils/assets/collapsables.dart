import 'package:flutter/material.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class CollapsableWithText extends StatefulWidget {
  final String title;
  final Widget child;

  const CollapsableWithText({
    Key? key,
    required this.title,
    this.child = const Text(""),
  }) : super(key: key);

  @override
  State<CollapsableWithText> createState() => _CollapsableWithTextState();
}

class _CollapsableWithTextState extends State<CollapsableWithText> {
  ///If the box is expanded
  bool _isExpanded = false;

  ///Toggle the box to expand or collapse
  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: _toogleExpand,
            child: Container(
              height: 55,
              decoration: const BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(
                        color: CustomColors.grey25Black,
                        width: 0.5,
                      )
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CustomGlobal.paddingInline

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterText(
                      text: widget.title,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    _isExpanded ? CustomIcons.arrowUp() : CustomIcons.arrowDown(),
                  ],
                ),
              ),
            ),
          ),
        ),
        ExpandedSection(
          expand: _isExpanded,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25.0),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

class ExpandedSection extends StatefulWidget {

  final Widget child;
  final bool expand;
  const ExpandedSection({
    super.key,
    this.expand = false,
    required this.child,
  });

  @override
  ExpandedSectionState createState() => ExpandedSectionState();
}

class ExpandedSectionState extends State<ExpandedSection> with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500)
    );
    Animation<double> curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {

        });
      }
      );
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.expand) {
      expandController.forward();
    }
    else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: widget.child
    );
  }
}
