import 'package:flutter_ui/feed/feed1/model.dart';

class Provider {
  static Feed feed() {
    return Feed(
      user: User(
        name: 'Talat El Beick',
        avatar: 'assets/images/profiles/me.jpg',
      ),
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In egestas mauris quis ante molestie, eu lobortis massa ullamcorper.",
      comments: 256,
      loves: 486,
    );
  }
}
