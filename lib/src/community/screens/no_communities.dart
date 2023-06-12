// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/home/controllers/home_controller.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

class NoCommunities extends StatelessWidget {
  const NoCommunities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/launcher_icons/icon1024.png',
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: context.height * 0.1,
            ),
            const Text("You have no communities. Create or join a community."),
            const SizedBox(height: 20),
            Container(
              height: 20,
              margin: const EdgeInsets.only(bottom: 15),
              child: AddItemText(
                onPressed: () {
                  context.toNamed(AppRouter.addCommunity, arguments: context.read<HomeController>());
                },
                text: 'Add Community',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
