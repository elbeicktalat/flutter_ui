import 'package:flutter_ui/profiles/profile10/user.dart';

class Provider {
  static Profile profile() {
    return Profile(
      user: User(
        name: 'Talat El Beick',
        address: 'Milan, Italy',
        avatar: 'assets/images/profiles/me.jpg',
      ),
      shots: 320,
    );
  }
}
