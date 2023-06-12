import 'package:flutter/material.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import 'routes.dart';

void main() {
  runApp(const ScreenList());
}

class ScreenList extends StatelessWidget {
  const ScreenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.5,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: SampleAppRouter.routes,
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: CustomGlobal.paddingTop,
                  left: CustomGlobal.paddingInline,
                  right:CustomGlobal.paddingInline,
                ),
                child: ListView(
                  children: [
                    _listItem(
                      context,
                      text: "Chat Screen (No Chats)",
                      navigator: SampleAppRouter.chatScreenNoChats,
                    ),
                    _listItem(
                      context,
                      text: "Chat Screen (With chats)",
                      navigator: SampleAppRouter.chatScreenWithChats,
                    ),
                    _listItem(
                      context,
                      text: "Chat Settings",
                      navigator: SampleAppRouter.chatSettings,
                    ),
                    _listItem(
                      context,
                      text: "My Discussion Groups",
                      navigator: SampleAppRouter.myDiscussionGroups,
                    ),
                    _listItem(
                      context,
                      text: "Discover Discussion groups",
                      navigator: SampleAppRouter.discoverDiscussionGroups,
                    ),
                    _listItem(
                      context,
                      text: "Edit Group",
                      navigator: SampleAppRouter.editGroupChat,
                    ),
                    _sectionHeader(
                      title: "Groups"
                    ),
                    _listItem(
                      context,
                      text: "Add Group Members",
                      navigator: SampleAppRouter.addGroupMembers,
                    ),
                    _sectionHeader(
                      title: "Fundraiser",
                    ),
                    _listItem(
                      context,
                      text: "Finances",
                      navigator: SampleAppRouter.finances,
                    ),
                    _listItem(
                      context,
                      text: "Fundraiser",
                      navigator: SampleAppRouter.fundraiserScreen,
                    ),
                    _sectionHeader(
                      title: "Timeline",
                    ),
                    _listItem(
                      context,
                      text: "Comments Screen",
                      navigator: SampleAppRouter.commentsScreen,
                    ),
                  ],
                ),
              ),
            )
          );
        }
      ),
    );
  }

  Widget _sectionHeader({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
        top: 30,
      ),
      child: HeadingText(
        text: title,
      ),
    );
  }

  Widget _listItem(BuildContext context, {required String text, required String navigator}) {
    return MainBtn(
      text: text,
      onPressed: (){
        Navigator.pushNamed(context, navigator);
      },
      color: CustomColors.blue,
      textColor: Colors.white,
    );
  }
}
