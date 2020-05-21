class User {
  String email;
  String password;
  String username;

  User({
    this.email,
    this.password,
    this.username
  });

  factory User.fromJson(Map doc) {
    return User(
      email: doc['email'],
      password: doc['password'],
      username: doc['username']
    );
  }

  Map<String, dynamic> toJson()  => {
      "email": this.email,
      "password": this.password,
      "username": this.username
    };
}