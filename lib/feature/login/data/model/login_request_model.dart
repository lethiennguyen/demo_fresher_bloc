class LoginRequestModel {
  LoginRequestModel({
    required this.username,
    required this.password,
  });

  final String? username;
  final String? password;

  LoginRequestModel copyWith({
    String? username,
    String? password,
  }) {
    return LoginRequestModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      username: json["username"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
