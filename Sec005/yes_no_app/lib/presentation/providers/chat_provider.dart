import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: '¿Ya regresaste del trabajo?', fromWho: FromWho.me),
    Message(text: '¿Quieres cenar?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    // TODO: implementar metodo
  }
}
