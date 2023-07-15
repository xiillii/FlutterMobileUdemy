import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i2.wp.com/ui-avatars.com/api//Mi%20Amuchit/128?ssl=1'),
          ),
        ),
        title: const Text('Mi Amuchis 😘'),
        centerTitle: false,
      ),
    );
  }
}
