class User {
  String? name, address, avatar;

  User({this.name, this.address, this.avatar});
}

class Profile {
  User? user;
  int? shots;

  Profile({this.user, this.shots});
}
