// Project imports:
import 'package:solid_social/src/app/bootstrap/bootstrap_controller.dart';
import 'package:solid_social/src/app/bootstrap/stream_chat_controller/chat_state.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamChatController extends BootstrapController {
  StreamChatController(super.services);

  ChatState _state = const ChatState.idle();
  set state(ChatState state) {
    _state = state;
    notifyListeners();
  }

  StreamChatClient get client => services.chatClient.client;

  ChatState get state => _state;

  Future<void> connectUser({
    required String userId,
    required String firstName,
    required String lastName,
  }) async {
    state = const ChatState.connecting();
    final user = await services.chatClient.connectUser(userId: userId, firstName: firstName, lastName: lastName);
    state = ChatState.connectedUser(user);
  }
}
