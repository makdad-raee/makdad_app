import 'package:makdad_app/features/data/models/user_model.dart';

class PostModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? postText;
  String? postImage;
  UserModel? usermodel;

  PostModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.postText,
    this.postImage,
    this.usermodel,
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    postText = json['postText'];
    postImage = json['postImage'];
    usermodel = UserModel.fromJson(json['usermodel']);
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "uId": uId,
      'image': image,
      'dateTime': dateTime,
      'postText': postText,
      'postImage': postImage,
      'usermodel': usermodel?.toMap()
    };
  }
}
