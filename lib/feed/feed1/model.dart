class User {
  String name, avatar;

  User({required this.name, required this.avatar});
}

class Feed {
  User user;
  String body;
  int? comments, loves;

  Feed({required this.user, required this.body, this.comments, this.loves});
}
