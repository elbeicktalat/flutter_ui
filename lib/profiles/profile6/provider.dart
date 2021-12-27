import 'package:flutter_ui/profiles/profile6/user.dart';

class Provider {
  static Profile profile() {
    return Profile(
      user: User(
        name: 'Talat El Beick',
        about:
            "With his precious eye for story, great composition, and settled colors, Jon has been my favorite travel photographer for some time now. He seeks real stories and takes pictures of everyday life. He travels to places I dream of and captures the moments in a way that makes you feel like you are there, standing right next to him.",
        profession: 'Photography',
      ),
      followers: 2318,
      following: 364,
      friends: 175,
    );
  }
}
