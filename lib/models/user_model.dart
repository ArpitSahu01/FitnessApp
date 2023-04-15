import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String userName;
  final String email;
  final String? gender;
  final String? date;
  final double? weight;
  final double? height;

  const UserModel(
      {required this.id,
      required this.email,
      required this.userName,
      required this.gender,
      required this.date,
      required this.weight,
      required this.height});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userName": userName,
      "email": email,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["email"],
      userName: data["userName"],
      gender: data["gender"],
      height: data["height"],
      date: data["date"],
      weight: data["weight"],
    );
  }
}
