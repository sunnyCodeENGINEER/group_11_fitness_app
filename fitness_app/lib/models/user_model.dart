class User {
  final int id;
  final String lastname;
  final String firstname;
  final String gender;
  final int age;
  final String email;
  final String phoneNumber;

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
