import 'package:adventurize/domain/entities/user.dart';

class UserModel extends User{
  final String id;
  final String email;
  final String displayName;

  UserModel({
    this.id = "",
    this.email = "",
    this.displayName = "",
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      displayName: json['displayName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
    };
  }
}