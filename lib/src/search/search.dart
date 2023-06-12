// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:solid_social/utils/assets/textstyles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusScopeNode node = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: HeadingText(text: "Search")),

            // Row(
            //   children: context
            //       .read<Bootstrap>()
            //       .getEmojis()
            //       .map((e) => Text(e.code,
            //           style: TextStyle(
            //             fontSize: 18,
            //             color: Colors.black,
            //           )))
            //       .toList(),
            // ),
            // AddReactionButton(
            //   focusScopeNode: node,
            //   isSentByMe: true,
            //   onTap: () {
            //     node.requestFocus();
            //   },
            //   reactionSelections: context.read<Bootstrap>().getEmojis().sublist(0, 5),
            // )
          ],
        ),
      ),
    );
  }
}
