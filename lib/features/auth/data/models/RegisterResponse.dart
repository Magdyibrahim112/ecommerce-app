import 'User.dart';

class RegisterResponse {
  const RegisterResponse({
    required  this.message,
    required this.user,
    required this.token,});
  // the factory => is constructor return object from RegisterResponse
  factory RegisterResponse.fromJson(dynamic json) {
    return RegisterResponse(message: json["message"],
        user:User.fromJson(json["user"]), token: json["token"]);
  }
 final String message;
  final User user;
  final String token;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['message'] = message;
  //   if (user != null) {
  //     map['user'] = user.toJson();
  //   }
  //   map['token'] = token;
  //   return map;
  // }

}