import 'package:flutter/material.dart';
import 'package:flutter_ui/chats/chat1/chat_1_conversation.dart';

import 'chats/chat1/chat_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Chat1(),
    );
  }
}
