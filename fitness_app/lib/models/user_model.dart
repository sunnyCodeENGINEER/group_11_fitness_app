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
}

// model user
User modelUser =
    User(1, 'Doe', 'John', 'Male', 28, 'jogndoe@you.us', '0200000000');
