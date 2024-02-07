import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/post_model.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/chats/chats.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/feeds.dart';
import 'package:makdad_app/features/data/presentation/views/new_post/new_post_view.dart';
import 'package:makdad_app/features/data/presentation/views/settings/settings.dart';
import 'package:makdad_app/features/data/presentation/views/users/users.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit(this.usermodel) : super(SocialIntialState());

  static SocialCubit get(context) {
    return BlocProvider.of(context);
  }

  UserModel usermodel;

  void getUserData() {
    emit(SocialGetUserLoadinState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      usermodel = UserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccesState(model: usermodel));
    }).catchError((error) {
      print(error.toString());
      emit(
        SocialGetUserErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  int currentIndex = 0;
  List<Widget> screensNave = const [
    FeedsScreen(),
    ChatsScreen(),
    NewPostView(),
    UsersScreen(),
    SettingsScreen(),
  ];
  List<String> titlels = const [
    'Home',
    'Chats',
    'add post',
    'Friends',
    'Settings',
  ];
  void changeBottomNav(index) {
    if (index == 2) {
      emit(SocialNewPostBottomNavState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  final ImagePicker picker = ImagePicker();
  File? profileimage;
  Future<void> pickProfileImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileimage = File(pickedImage.path);
      emit(SocialPickedProfileImageSuccesState());
    } else {
      print('No  Image Selected');
      emit(SocialPickedProfileImageSuccesState());
    }
  }

  File? coverImage;
  Future<void> pickCoverImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      coverImage = File(pickedImage.path);
      emit(SocialPickedCoverImageSuccesState());
    } else {
      print('No  Image Selected');
      emit(SocialPickedCoverImageErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileimage!.path).pathSegments.last}')
        .putFile(profileimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialUploadProfileImageSuccesState());
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          profileImage: value,
        );
        print(value);
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialUploadCoverImageSuccesState());
        updateUser(name: name, phone: phone, bio: bio, coverImage: value);

        print(value);
      }).catchError((error) {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadCoverImageErrorState());
    });
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? profileImage,
    String? coverImage,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      bio: bio,
      uId: uId,
      isEmailVerfied: false,
      email: usermodel.email,
      coverImage: coverImage ?? usermodel.coverImage,
      image: profileImage ?? usermodel.image,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }

  File? postImage;
  Future<void> pickPostImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      postImage = File(pickedImage.path);
      emit(SocialPickedPostImageSuccesState());
    } else {
      print('No  Image Selected');
      emit(SocialPickedPostImageSuccesState());
    }
  }

  void uploadImagePost({
    required String? dateTime,
    required String? postText,
  }) {
    emit(SocialCreatePostLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('Posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialUploadProfileImageSuccesState());

        print(value);
        createNewPost(dateTime: dateTime, postText: postText, postImage: value);
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  void createNewPost({
    required String? dateTime,
    required String? postText,
    String? postImage,
  }) {
    emit(SocialCreatePostLoadingState());
    PostModel model = PostModel(
      name: usermodel.name,
      image: usermodel.image,
      uId: usermodel.uId,
      dateTime: dateTime,
      postImage: postImage ?? '',
      postText: postText,
    );
    FirebaseFirestore.instance
        .collection('Posts')
        .add(model.toMap())
        .then((value) {
      emit(SocialCreatePostSuccesState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  void removePostImage() {
    postImage = null;
    emit(SocialRemovePostImageState());
  }

  List<PostModel> posts = [];
  List<String> postId = [];
  List<int> likesCount = [];
  List<int> commentCount = [];
  void getPosts() {
    FirebaseFirestore.instance.collection('Posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likesCount.add(value.docs.length);
          postId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        }).catchError((error) {});
        element.reference.collection('Comments').get().then((value) {
          commentCount.add(value.docs.length);
        }).catchError((error) {});
      });
      emit(SocialGetPostsSuccesState());
    }).catchError((error) {
      emit(SocialGetPostsErrorState(error: error.toString()));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .collection('likes')
        .doc(usermodel.uId)
        .set({'like': true}).then((value) {
      emit(SocialLikePostsSuccesState());
    }).catchError((error) {
      emit(SocialLikePostsErrorState(error: error.toString()));
    });
  }

  void commentPost({required String postId, required String commentText}) {
    FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .collection('Comments')
        .doc(usermodel.uId)
        .set({
      'comment': true,
      'commentText':commentText,
    }).then((value) {
      emit(SocialCommentPostsSuccesState());
    }).catchError((error) {
      emit(SocialCommentPostsErrorState(error: error));
    });
  }
}
