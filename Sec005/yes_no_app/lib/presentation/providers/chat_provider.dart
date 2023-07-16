import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: '¿Ya regresaste del trabajo?', fromWho: FromWho.me),
    Message(text: '¿Quieres cenar?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

    notifyListeners();
    moveScrollToBottom();

    if (text.endsWith('?')) {
      herReply();
    }
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messages.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(microseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeOut);
  }
}
