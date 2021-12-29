import 'package:flutter_ui/chats/chat1/models/contact.dart';
import 'package:flutter_ui/chats/chat1/models/conversion.dart';
import 'package:flutter_ui/chats/chat1/models/massage.dart';

class Provider {
  static Conversion _conversion({
    required Contact receiver,
    required Contact sender,
  }) {
    return Conversion(
      contact: receiver,
      massages: [
        Massage(
          sender: sender,
          receiver: receiver,
          dateTime: '23:35',
          body: 'Hi ${receiver.name} how are you?',
        ),
        Massage(
          sender: sender,
          receiver: receiver,
          dateTime: '23:35',
          body: 'Hi ${sender.name} I am fine thank you',
        ),
        Massage(
          sender: sender,
          receiver: receiver,
          dateTime: '23:36',
          body: 'And you?',
        ),
        Massage(
          sender: sender,
          receiver: receiver,
          dateTime: '23:36',
          body: 'I am also fine thank you',
        ),
        Massage(
          sender: sender,
          receiver: receiver,
          dateTime: '23:36',
          body: 'Do you want take your coffee with me?',
        ),
        Massage(
          sender: sender,
          receiver: receiver,
          dateTime: '23:37',
          body: 'Off course let me know where',
        ),
        Massage(
          sender: sender,
          receiver: receiver,
          dateTime: '23:37',
          body: 'Well there is great cafeteria under my house',
        ),
        Massage(
          sender: sender,
          receiver: receiver,
          dateTime: '23:37',
          body: 'All right ${receiver.name} see after',
        ),
      ],
    );
  }

  static List<Conversion> getConversions() {
    Contact contact1 = Contact(
      name: 'Talat El Beick',
      phone: '351-354-XXXX',
      avatar: 'assets/images/profiles/me.jpg',
    );
    Contact contact2 = Contact(
      name: 'Harry',
      phone: '324-486-XXXX',
      avatar: 'assets/images/profiles/profile_1.jpg',
    );
    Contact contact3 = Contact(
      name: 'Oliver',
      phone: '366-684-XXXX',
      avatar: 'assets/images/profiles/profile_7.jpg',
    );
    Contact contact4 = Contact(
      name: 'Sara',
      phone: '311-984-XXXX',
      avatar: 'assets/images/profiles/profile_3.jpg',
    );

    return [
      _conversion(sender: contact1, receiver: contact2),
      _conversion(sender: contact1, receiver: contact3),
      _conversion(sender: contact1, receiver: contact4),
    ];
  }
}
