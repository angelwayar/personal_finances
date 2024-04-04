class User {
  String email;

  User({
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {"email": email};
}
