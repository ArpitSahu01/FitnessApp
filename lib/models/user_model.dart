import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{

  final String id;
  final String userName;
  final String email;

  const UserModel({required this.id,required this.email,required this.userName});

  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "userName":userName,
      "email":email,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    return UserModel(id: document.id, email: data["email"], userName: data["userName"]);
  }

}