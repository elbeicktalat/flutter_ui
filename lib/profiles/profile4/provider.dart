import 'package:flutter_ui/profiles/profile4/user.dart';

class Provider {
  static Profile profile() {
    return Profile(
      user: User(
        name: 'Talat El Beick',
        about:
            'Published wedding, beauty, fashion, portrait photographer and retoucher.',
        profession: 'Photography',
      ),
      followers: 2318,
      following: 364,
      friends: 175,
    );
  }
}
