import 'package:makdad_app/features/data/models/post_model.dart';
import 'package:makdad_app/features/data/models/user_model.dart';

class GroupModel {
  String name;
  String uId;
  String type;

  String? image;
  UserModel owner;
  PostModel? posts;
  UserModel? members;
  GroupModel(
      {required this.name,
      required this.uId,
      required this.type,
      this.image,
      required this.owner,
      this.posts,
      this.members});
  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      uId: json['uId'],
      name: json['name'],
      type: json['type'],
      image: json['image'] ?? '',
      owner: UserModel.fromJson(json['owner']),
      posts: PostModel.fromJson(json['posts']),
      members: UserModel.fromJson(json['members']),
      // posts: json['posts'].map((e) {
      //   return PostModel.fromJson(e);
      // }).toList(),
      // members: json['members'].map((e) {
      //   return UserModel.fromJson(e);
      // }).toList(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'type': type,
      'image': image,
      'owner': owner.toMap(),
      'posts': posts?.toMap(),
      'members': members?.toMap()

      // 'posts': posts!.map((e) {
      //   return e.toMap();
      // }).toList(),
      // 'members': members!.map((e) {
      //   return e.toMap();
      // }).toList(),
    };
  }
}
