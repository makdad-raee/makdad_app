class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerfied;

  UserModel({this.name, this.email, this.phone, this.uId,this.isEmailVerfied});
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerfied = json['isEmailVerfied'];
  }
  Map<String, dynamic> toMap(){
    return {
      "name":name,
      "email":email,
      "phone":phone,
      "uId":uId,
      'isEmailVerfied':isEmailVerfied
  };
}
}