import 'package:flutter/material.dart';

class VideoChatCard extends StatelessWidget {
  final Color color;

  const VideoChatCard({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      ),
    );
  }
}
