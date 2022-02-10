class User {
  String? name, address, avatar;

  User({this.name, this.address, this.avatar});
}

class Profile {
  User? user;
  int? followers, following, likes;

  Profile({this.user, this.followers, this.following, this.likes});
}
