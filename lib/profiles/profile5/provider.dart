import 'package:flutter_ui/profiles/profile5/user.dart';

class Provider {
  static Profile profile() {
    return Profile(
      user: User(
        name: 'Talat El Beick',
        about:
            "I always love seeing how another photographer captures a particular place that I've been to.",
        profession: 'Photography',
      ),
      followers: 2318,
      following: 364,
      friends: 175,
    );
  }
}
