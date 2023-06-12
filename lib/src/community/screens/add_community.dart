// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/community/controllers/communities_controller.dart';
import 'package:solid_social/utils/assets/buttons_header.dart';
import 'package:solid_social/utils/assets/cards.dart';
import '../../../utils/assets/textstyles.dart';

class AddCommunityScreen extends StatefulWidget {
  const AddCommunityScreen({Key? key, required this.controller}) : super(key: key);

  final CommunityController controller;

  @override
  State<AddCommunityScreen> createState() => _AddCommunityScreenState();
}

class _AddCommunityScreenState extends State<AddCommunityScreen> {
  final double _paddingInline = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('${ModalRoute.of(context)?.settings.name}');
    return ChangeNotifierProvider.value(
      value: widget.controller,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Image.asset(
                "assets/backgrounds/community/communityBackground.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Scaffold(
                appBar: AppBar(
                  leading: const CustomBackButton(),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: _paddingInline, top: 50, bottom: 30),
                        child: const HeadingText(
                          text: "Add a SolidSocial\nCommunity",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: _paddingInline, vertical: 15),
                        child: CommunityCard(
                          title: "Create Community",
                          subtitle: "Start a new community and manage members and activities.",
                          iconAsset: "assets/backgrounds/community/create-community.svg",
                          onPressed: () {
                            context.off(
                              AppRouter.createCommunity,
                              arguments: widget.controller.createCommunityController,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: _paddingInline, vertical: 15),
                        child: CommunityCard(
                          title: "Join Community",
                          subtitle: "Join already existing community of people with common interest.",
                          iconAsset: "assets/backgrounds/community/join-community.svg",
                          onPressed: () {
                            context.off(AppRouter.joinCommunity, arguments: widget.controller.joinCommunityController);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
