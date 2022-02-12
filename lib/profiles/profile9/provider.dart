import 'package:flutter_ui/profiles/profile9/user.dart';

class Provider {
  static Profile profile() {
    return Profile(
      user: User(
        name: 'Talat El Beick',
        address: 'Milan, Italy',
        avatar: 'assets/images/profiles/me.jpg',
        about:
            "In each of her images, I feel the heart that went into taking it, and it's the emotion of the image which penetrates through to be incredibly powerful. She travels all over the world and often around Australia. Like me, she has a deep love for Nepal and the pictures she took in the country really took my breath away.",
      ),
      followers: 445,
      following: 250,
      likes: 320,
    );
  }
}
