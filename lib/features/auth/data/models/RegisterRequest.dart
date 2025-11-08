class RegisterRequest {
  const RegisterRequest({
      required this.name,
      required this.email,
      required this.password,
      required this.rePassword,
    required this.phone,});

 factory RegisterRequest.fromJson(dynamic json) {
   return RegisterRequest(name: json['name'], email: json['email'], password: json['password'], rePassword: json['password'], phone: json['phone']);

  }
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = password;
    map['phone'] = phone;
    return map;
  }

}