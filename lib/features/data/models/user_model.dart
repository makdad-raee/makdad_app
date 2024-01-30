class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerfied;
  String? image;
  String? coverImage;
  
  String ? bio;

  UserModel({this.name, this.email, this.phone, this.uId,this.isEmailVerfied,this.image,this.bio,this.coverImage});
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerfied = json['isEmailVerfied'];
    image=json['image'];
    coverImage=json['coverImage'];
    bio=json['bio'];
  }
  Map<String, dynamic> toMap(){
    return {
      "name":name,
      "email":email,
      "phone":phone,
      "uId":uId,
      'isEmailVerfied':isEmailVerfied,
      'image':image,
      'bio':bio,
      'coverImage':coverImage
  };
}
}