import 'package:flutter_ui/chats/chat1/models/contact.dart';
import 'package:flutter_ui/chats/chat1/models/conversion.dart';
import 'package:flutter_ui/chats/chat1/models/massage.dart';

class Provider {
  static Conversion _conversion(Contact contact1, Contact contact2) {
    return Conversion(
      contact: contact2,
      massages: [
        Massage(
          sender: contact1,
          receiver: contact2,
          dateTime: '08:35',
          body: 'Hi ${contact2.name} how are you?',
        ),
        Massage(
          sender: contact2,
          receiver: contact1,
          dateTime: '08:36',
          body: 'Hi ${contact1.name} I am fine thank you',
        ),
        Massage(
          sender: contact2,
          receiver: contact1,
          dateTime: '08:36',
          body: 'And you?',
        ),
        Massage(
          sender: contact1,
          receiver: contact2,
          dateTime: '08:37',
          body: 'I am also fine thank you',
        ),
        Massage(
          sender: contact2,
          receiver: contact1,
          dateTime: '08:37',
          body: 'Do you want take your coffee with me?',
        ),
        Massage(
          sender: contact1,
          receiver: contact2,
          dateTime: '08:37',
          body: 'Off course let me know where',
        ),
        Massage(
          sender: contact2,
          receiver: contact1,
          dateTime: '08:38',
          body: 'Well there is great cafeteria under my house, what do you think about going there.',
        ),
        Massage(
          sender: contact1,
          receiver: contact2,
          dateTime: '08:40',
          body: 'Nice idea ${contact2.name} see you there!',
        ),
      ],
    );
  }

  static List<Conversion> getConversions() {
    Contact contact1 = Contact(
      name: 'Talat',
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
      _conversion(contact1, contact2),
      _conversion(contact1, contact3),
      _conversion(contact1, contact4),
    ];
  }
}
