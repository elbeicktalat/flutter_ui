import 'package:flutter_ui/profiles/profile9/user.dart';

class Provider {
  static Profile profile() {
    return Profile(
      user: User(
        name: 'Talat El Beick',
        address: 'Milan, Italy',
        avatar: 'assets/images/profiles/me.jpg',
      ),
      followers: 445,
      following: 250,
      likes: 320,
    );
  }
}
