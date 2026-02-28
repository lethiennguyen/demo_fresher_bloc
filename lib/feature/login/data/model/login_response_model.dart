// class LoginResponseModel {
//   LoginResponseModel({
//     required this.data,
//   });
//
//   final Data? data;
//
//   LoginResponseModel copyWith({
//     Data? data,
//   }) {
//     return LoginResponseModel(
//       data: data ?? this.data,
//     );
//   }
//
//   factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
//     return LoginResponseModel(
//       data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         "data": data?.toJson(),
//       };
// }

class LoginResponseModel {
  LoginResponseModel({
    required this.accessToken,
  });

  final String? accessToken;

  LoginResponseModel copyWith({
    String? accessToken,
  }) {
    return LoginResponseModel(
      accessToken: accessToken ?? this.accessToken,
    );
  }

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json["access_token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
      };
}
