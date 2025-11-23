class User {
  const User({
      required this.name,
      required this.email,
      required this.role,});

  factory User.fromJson(dynamic json) {
    return User(name: json['name'], email: json['email'], role: json['role']);

  }
  final String name;
  final String email;
  final String role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }


}