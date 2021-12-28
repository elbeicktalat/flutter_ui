import 'package:flutter_ui/profiles/profile7/user.dart';

class Provider {
  static Profile profile() {
    return Profile(
      user: User(
        name: 'Talat El Beick',
        about: 'Published wedding, beauty, fashion, portrait photographer.',
        profession: 'Photography',
      ),
      followers: 2318,
      following: 364,
      friends: 175,
    );
  }
}
