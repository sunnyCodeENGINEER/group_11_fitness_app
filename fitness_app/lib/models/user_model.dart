class User {
  final int id;
  String lastname;
  String firstname;
  final String gender;
  final int age;
  String email;
  String phoneNumber;

  User(this.id, this.lastname, this.firstname, this.gender, this.age,
      this.email, this.phoneNumber);

  List<dynamic> toList() {
    return [id, lastname, firstname, email, phoneNumber];
  }
}

// model user
User modelUser =
    User(1, 'Doe', 'John', 'Male', 28, 'jogndoe@you.us', '0200000000');

class Level {
  final int id;
  final String name;
  final String sets;
  final String repsPerSet;

  Level(this.id, this.name, this.sets, this.repsPerSet);

  List<dynamic> toList() {
    return [id, name, sets, repsPerSet];
  }
}

Level modelLevel = Level(0, "name", "0", "0");

class UserDetails {
  String username;
  String password;
  int levelID;
  int splitID;
  User user;

  UserDetails(
      {required this.username,
      required this.password,
      required this.levelID,
      required this.splitID,
      required this.user});
}

UserDetails userDetails = UserDetails(
    username: "", password: "", levelID: 0, splitID: 0, user: modelUser);
