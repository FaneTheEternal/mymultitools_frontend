import 'dart:convert';

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String userToJson(User user) {
  final jsonUser = user.toJson();
  return json.encode(jsonUser);
}

class User {
  int id;
  String token;

  User({this.id, this.token});

  factory User.fromJson(Map<String, dynamic> json) =>
      new User(id: json['id'], token: json['token']);

  Map<String, dynamic> toJson() => {'id': id, 'token': token};
}
