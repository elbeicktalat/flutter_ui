import 'package:flutter_ui/chats/chat1/models/contact.dart';

class Massage {
  Contact sender, receiver;
  String dateTime;
  String body;

  Massage({
    required this.sender,
    required this.receiver,
    required this.dateTime,
    required this.body,
  });
}
