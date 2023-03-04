// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;

  User({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  
  @override
  String toString() {
    return 'User(id: $id, name: $name, phone: $phone, email: $email, password: $password)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map["id"]: null,
      name: map['name'] != null ? map["name"] : null,
      phone: map['phone'] != null ? map["phone"]: null,
      email: map['email'] != null ? map["email"]: null,
      password: map['password'] != null ? map["password"]: null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
