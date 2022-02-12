class User {
  String? name, address, about, avatar;

  User({this.name, this.address, this.about, this.avatar});
}

class Profile {
  User? user;
  int? followers, following, likes;

  Profile({this.user, this.followers, this.following, this.likes});
}
