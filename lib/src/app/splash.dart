// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// Package imports:
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/bootstrap/stream_chat_controller/stream_chat_controller.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      context.read<AuthController>().checkPersistance();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('${ModalRoute.of(context)?.settings.name}');

    return Builder(builder: (context) {
      context.read<AuthController>().stateNotifier = (state) {
        state.maybeWhen(
          loggedIn: (user) {
            context
                .read<StreamChatController>()
                .connectUser(userId: user.uid, firstName: user.firstName, lastName: user.lastName);
            context.offAll(AppRouter.feed);
          },
          logOut: () {
            context.offAll(AppRouter.welcome);
          },
          orElse: () {},
        );
      };

      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/launcher_icons/icon1024.png",
                height: 200,
                width: 200,
              ),
              Text('Solid Social', style: context.textTheme.headline4)
            ],
          ),
        ),
      );
    });
  }
}
