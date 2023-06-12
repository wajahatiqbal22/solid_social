// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// Project imports:
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/app/bootstrap/stream_chat_controller/stream_chat_controller.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Bootstrap()),
      ],
      child: Builder(builder: (context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => AuthController(context.read<Bootstrap>(),
                    stateNotifier: (state) {})),
            ChangeNotifierProvider(
                create: (context) =>
                    StreamChatController(context.read<Bootstrap>())),
          ],
          child: Builder(builder: (context) {
            return MaterialApp(
              title: 'Solid Social App',
              theme: ThemeData(
                primaryColor: Colors.white,
                textTheme: GoogleFonts.interTextTheme(),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  actionsIconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  elevation: 0,
                  foregroundColor: Colors.black,
                ),
                scaffoldBackgroundColor: Colors.white,
              ),
              builder: (context, child) {
                return StreamChat(
                  client: context.read<Bootstrap>().chatClient.client,
                  //To unfocus when clicked anywhere in app
                  child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        WidgetsBinding.instance.focusManager.primaryFocus
                            ?.unfocus();
                      },
                      child: child),
                );
              },
              onGenerateRoute: (settings) =>
                  AppRouter.onGenerateRoute(settings, context),
            );
          }),
        );
      }),
    );
  }
}
