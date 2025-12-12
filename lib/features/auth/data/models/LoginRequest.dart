class LoginRequest {
 const LoginRequest({
     required this.email,
     required this.password,});

  // LoginRequest.fromJson(dynamic json) {
  //   email = json['email'];
  //   password = json['password'];
  // }
  final String? email;
  final String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  // in Request i need toJson only....


}