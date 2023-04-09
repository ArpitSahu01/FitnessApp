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

}