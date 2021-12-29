import 'package:flutter_ui/profiles/profile8/user.dart';

class Provider {
  static Profile profile() {
    return Profile(
      user: User(
        name: 'Talat El Beick',
        profession: 'Photography',
      ),
      followers: 2318,
      following: 364,
      friends: 175,
    );
  }

  List<String> photos() {
    return List.generate(15, (index) {
      return 'assets/images/profiles/profile_1.jpg';
    });
  }

  List<String> videos() {
    return List.generate(15, (index) {
      return 'assets/images/profiles/profile_4.jpg';
    });
  }

  List<String> posts() {
    return List.generate(15, (index) {
      return 'assets/images/profiles/profile_7.jpg';
    });
  }

  List<String> friends() {
    return List.generate(15, (index) {
      return 'assets/images/profiles/me.jpg';
    });
  }
}
