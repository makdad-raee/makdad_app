import 'package:makdad_app/features/data/models/user_model.dart';

class PageModel {
  String name;
  String? image;
  String uId;
  UserModel? members;
  UserModel pageOwner;
  PageModel({
    required this.name,
    this.image,
    required this.uId,
    this.members,
    required this.pageOwner,
  });
  factory PageModel.fromJson(Map<String, dynamic> json) {
    return PageModel(
      name: json["name"],
      image: json["image"],
      uId: json["uId"],
      members: UserModel.fromJson(json["members"]),
      pageOwner: UserModel.fromJson(json["pageOwner"]),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "image": image,
      "uId": uId,
      "memebers": members?.toMap(),
      "pageOwner": pageOwner.toMap(),
    };
  }
}
