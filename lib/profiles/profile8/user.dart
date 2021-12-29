class User {
  String? name, about, profession;

  User({
    this.name,
    this.profession,
  });
}

class Profile {
  User? user;
  int? followers, following, friends;

  Profile({
    this.user,
    this.followers,
    this.following,
    this.friends,
  });
}
