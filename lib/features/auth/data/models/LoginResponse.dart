import 'User.dart';

class LoginResponse {
  const LoginResponse({
    required  this.message,
    required  this.user,
    required  this.token,});

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(message: json['message'], user: User.fromJson(json['user']), token: json['token']);

  }
  //in Response i need fromJson only....
 final String? message;
 final User? user;
 final String? token;


  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['message'] = message;
  //   if (user != null) {
  //     map['user'] = user?.toJson();
  //   }
  //   map['token'] = token;
  //   return map;
  // }

}