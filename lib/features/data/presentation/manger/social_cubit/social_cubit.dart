import 'dart:io';
import 'package:dio/dio.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makdad_app/core/utils/cashe_helper.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/comment_model.dart';
import 'package:makdad_app/features/data/models/message_model.dart';
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
      // print(value.data());
      usermodel = UserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccesState(model: usermodel));
    }).catchError((error) {
      // print(error.toString());
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
      if (index == 1) {
        getAllUsers();
      }
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

  List<String> profileImagesList = [];
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
        profileImagesList.add(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          profileImage: value,
        );

        // print(value);
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
      print('=====================================');
      print(error.toString());
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

        // print(value);
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

      for (int i = 0; i < postId.length; i++) {
        //PostModel post=   posts[i].usermodel=model;
        PostModel postModel = PostModel(
          uId: mypost[i].uId,
          usermodel: model,
          postText: mypost[i].postText,
          dateTime: mypost[i].dateTime,
          image: model.image,
          name: model.name,
          postImage: mypost[i].postImage,
        );
        FirebaseFirestore.instance.collection('Posts').get().then((value) {
          value.docs.forEach((element) {
            if (element.data()['uId'] == postModel.uId) {
              FirebaseFirestore.instance
                  .collection('Posts')
                  .doc(element.id)
                  .update(postModel.toMap())
                  .then((value) {})
                  .catchError((error) {});
            }
          });
        });
        // FirebaseFirestore.instance
        //     .collection('Posts')
        //     .doc(postId[i])
        //     .update(postModel.toMap())
        //     .then((value) {})
        //     .catchError((error) {});

        FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .collection('Posts')
            .doc(postId[i])
            .update(postModel.toMap())
            .then((value) {
          emit(SocialupdateNameAndPhotoOfThePostSuccesState());
        }).catchError((error) {
          emit(SocialupdateNameAndPhotoOfThePostErrorState(error: error));
        });
      }
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
      // print('No  Image Selected');
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
      usermodel: usermodel,
      name: usermodel.name,
      image: usermodel.image,
      uId: usermodel.uId,
      dateTime: dateTime,
      postImage: postImage ?? '',
      postText: postText,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('Posts')
        .add(model.toMap())
        .then((value) {
      emit(SocialCreatePostSuccesState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
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

  List<PostModel> mypost = [];
  List<String> postId = [];
  List<String> mypostId = [];
  List<int> likesCount = [];
  List<int> commentCount = [];
  List<PostModel> posts = [];
  void getmyPosts() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('Posts')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          // likesCount.add(value.docs.length);
          mypostId.add(element.id);
          mypost.add(PostModel.fromJson(element.data()));
        }).catchError((error) {});
        // element.reference.collection('comments').get().then((value) {
        //   commentCount.add(value.docs.length);
        // }).catchError((error) {});
      });
      emit(SocialGetMyPostsSuccesState());
    }).catchError((error) {
      emit(SocialGetmyPostsErrorState(error: error.toString()));
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
      print('======================================');
      print(postId.length.toString());
      print('======================================');
    }).catchError((error) {
      emit(SocialLikePostsErrorState(error: error.toString()));
    });
  }

  List<UserModel> users = [];
  void getAllUsers() {
    users = [];
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        if (element.data()['uId'] != usermodel.uId) {
          users.add(UserModel.fromJson(element.data()));
        }
      });
      emit(SocialGetALLUserSuccesState());
    }).catchError((error) {
      emit(SocialGetALLUserErrorState(error: error.toString()));
    });
  }

  void sendMessage({
    required String textMessge,
    required String reciverId,
    required String dateTime,
  }) {
    MessageModel messageModel = MessageModel(
        dateTime: dateTime,
        reciverId: reciverId,
        textMessge: textMessge,
        name: usermodel.name,
        senderID: usermodel.uId);
    //set my chat
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .collection('chats')
        .doc(reciverId)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(SocialSendMessageSuccesState());
    }).catchError((error) {
      emit(SocialSendMessageErrorState(error: error));
    });
    //set reciver chat
    FirebaseFirestore.instance
        .collection('users')
        .doc(reciverId)
        .collection('chats')
        .doc(usermodel.uId)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(SocialSendMessageSuccesState());
    }).catchError((error) {
      emit(SocialSendMessageErrorState(error: error));
    });
  }

  List<MessageModel> messages = [];
  void getMessages({required String reciverId}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .collection('chats')
        .doc(reciverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      for (var element in event.docs) {
        messages.add(MessageModel.fromJson(element.data()));
      }
      emit(SocialReciveMessageSuccesState());
    });
  }

  void sendComment(
      {required String commentText,
      required String postId,
      required PostModel postModel}) {
    CommentModel commentModel = CommentModel(
        commentText: commentText,
        dateTime: DateTime.now().toString(),
        image: usermodel.image,
        name: usermodel.name,
        reciveCommentId: postModel.uId);
    FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .collection('comments')
        .add(commentModel.toMap())
        .then((value) {
      emit(SocialCommentPostsSuccesState());
    }).catchError((error) {
      emit(SocialCommentPostsErrorState(error: error));
    });
  }

  List<CommentModel> comments = [];
  List<CommentModel> commentscount = [];
  void getComments({required String postId}) {
    FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .collection('comments')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      comments = [];
      for (var element in event.docs) {
        comments.add(CommentModel.fromJson(element.data()));

        emit(SocialGetALLCommentSuccesState());
      }
    });
  }

  Future getToken() async {
    print('==============================');
    String? myToken = await FirebaseMessaging.instance.getToken();
    print('==============================');
  }

  myRequestPremission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  sendMessageNoti({required String title, required String messagge}) async {
    Map<String, dynamic> headersList = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAQ7As_k0:APA91bGXFX9Fn0dOMs8yysBvzMs8NpdU206C5EYQZOSaACbHPBFdPzLXRxT3qtzOTBi_WEd3Soa5L5h5shN0zRB6_50-NdnW45YYiSnex2K6ruq40hyiam1yf4fl6cPF1-zZngZ8lH5N'
    };
    //var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    Map<String, dynamic> body = {
      "to":
          "dKHmr-08SWS6CuSKD2rBI9:APA91bEamk9fLB3BNnI7fLqhpeug9WYmP47A16mdn8RaHcwyWwssmQVK1eKiZOVR9TefbaCQY0ZranqySkoYVWU6Lm72eU2qWdquFKx3YNxlyOxSVOIeCdPQ62K1BFoIdem1fSUTIuzN",
      "notification": {
        "title": title,
        "body": messages,
        "mutable_content": true,
        "sound": "Tri-tone"
      }
    };

    final dio = Dio(
      BaseOptions(headers: headersList),
    );

    final response = await dio.post(
      'https://fcm.googleapis.com/fcm/send',
      data: body,
    );
    print('=======================Dio=======================');
    print(response.data);
    print('========================DIo======================');
  }

  void getPosts() {
    posts = [];
    postId = [];
    commentCount = [];
    FirebaseFirestore.instance.collection('Posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likesCount.add(value.docs.length);
          postId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        }).catchError((error) {});
        element.reference.collection('comments').get().then((valueComment) {
          commentCount.add(valueComment.docs.length);
        }).catchError((error) {});
      });
      emit(SocialGetPostsSuccesState());
    }).catchError((error) {
      emit(SocialGetPostsErrorState(error: error.toString()));
    });
  }

  List<PostModel> usersPosts = [];
  void getuservisitposts({required String uid}) {
    usersPosts = [];
    FirebaseFirestore.instance.collection('Posts').get().then((value) {
      value.docs.forEach((element) {
        if (element.data()['uId'] == uid) {
          usersPosts.add(PostModel.fromJson(element.data()));
          // print('=========================================');
          // print(usersPosts.length);
          // print('=========================================');
        }
        emit(SocialGetVisitUsersPostsSuccessState());
      });
    }).catchError((error) {
      emit(SocialGetVisitUsersPostsErrorState(error: error));
    });
  }

  void logOut() {
    uId = '';
    CasheHelper.removeData(key: uId);

    emit(SocialLogOutSuccessState());
  }

  void sendFriendRequest({required UserModel userModelRcieverAddRequest}) {
    UserModel userModelSenderAddRequest = UserModel(
        bio: usermodel.bio,
        coverImage: usermodel.coverImage,
        email: usermodel.email,
        image: usermodel.image,
        isEmailVerfied: usermodel.isEmailVerfied,
        name: usermodel.name,
        phone: usermodel.phone,
        uId: usermodel.uId);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection(friendSendRequestTable)
        .add(userModelRcieverAddRequest.toMap())
        .then((value) {
      emit(SocialAddFriendsSuccessState());
    }).catchError((error) {
      print('ooooooooooooo1111');
    });
    //======================
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModelRcieverAddRequest.uId)
        .collection(friendReciveRequest)
        .add(userModelSenderAddRequest.toMap())
        .then((value) {
      emit(SocialAddFriendsSuccessState());
    }).catchError((error) {
      emit(SocialAddFriendsErrorState(error: error.toString()));
      print('ooooooooooooo2222222');
    });
  }

  List<UserModel> sendFreindsRequest = [];
  void getsendFreindRequest() {
    sendFreindsRequest = [];
    FirebaseFirestore.instance
        .collection(usersTable)
        .doc(uId)
        .collection(friendSendRequestTable)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.data()['uId'] != uId) {
          sendFreindsRequest.add(UserModel.fromJson(element.data()));
          emit(SocialGetSendFreindRequestSuccessState());
        }
      });
    }).catchError((error) {
      emit(SocialGetSendFreindRequestErrorState(error: error.toString()));
    });
  }

  List<UserModel> reciverFreindsRequest = [];
  void getReciverFreindRequest() {
    reciverFreindsRequest = [];
    FirebaseFirestore.instance
        .collection(usersTable)
        .doc(uId)
        .collection(friendReciveRequest)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.data()['uId'] != uId) {
          reciverFreindsRequest.add(UserModel.fromJson(element.data()));
          emit(SocialGetReciverFreindRequestSuccessState());
          print('=============================');
          print(element.data());
          print('=============================');
        }
      });
    }).catchError((error) {
      emit(SocialGetReciverFreindRequestErrorState(error: error.toString()));
    });
  }

  void applyFriendRequest({required UserModel userModelWhoSendRequest}) {
    emit(SocialApplyFriendsRequestLoadingState());
    UserModel usermodelWhoAcceptRequest = UserModel(
      bio: usermodel.bio,
      coverImage: usermodel.coverImage,
      email: usermodel.email,
      image: usermodel.image,
      isEmailVerfied: usermodel.isEmailVerfied,
      name: usermodel.name,
      phone: usermodel.phone,
      uId: usermodel.uId,
    );

    FirebaseFirestore.instance
        .collection(usersTable)
        .doc(uId)
        .collection(friendsTable)
        .add(userModelWhoSendRequest.toMap())
        .then((value) {
      print('hoohohohoohohohohoohohoho');

      print(value.toString());
      print('hoohohohoohohohohoohohoho');
      emit(SocialApplyFriendsRequestSuccessState());
    }).catchError((error) {
      emit(SocialApplyFriendsRequestErrorState(error: error));
    });
    // =====
    FirebaseFirestore.instance
        .collection(usersTable)
        .doc(userModelWhoSendRequest.uId)
        .collection(friendsTable)
        .add(usermodelWhoAcceptRequest.toMap())
        .then((value) {
      print('hoohohohoohohohohoohohoho');

      print(value.toString());
      print('hoohohohoohohohohoohohoho');

      emit(SocialApplyFriendsRequestSuccessState());
    }).catchError((error) {
      emit(SocialApplyFriendsRequestErrorState(error: error));
    });
    // =======
    FirebaseFirestore.instance
        .collection(usersTable)
        .doc(uId)
        .collection(friendReciveRequest)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.data()['uId'] == userModelWhoSendRequest.uId) {
          FirebaseFirestore.instance
              .collection(usersTable)
              .doc(uId)
              .collection(friendReciveRequest)
              .doc(element.id)
              .delete()
              .then((value) {
            print(element.id);
            print('=================delete==============');

            print('=================delete==============');
          });
        }
      });
    }).catchError((error) {});
    //====delete from who send request

    FirebaseFirestore.instance
        .collection(usersTable)
        .doc(userModelWhoSendRequest.uId)
        .collection(friendSendRequestTable)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.data()['uId'] == usermodelWhoAcceptRequest.uId) {
          FirebaseFirestore.instance
              .collection(usersTable)
              .doc(usermodelWhoAcceptRequest.uId)
              .collection(friendSendRequestTable)
              .doc(element.id)
              .delete()
              .then((value) {
            print(element.id);
            print('=================delete==============');

            print('=================delete==============');
          });
          //  print(object)
        }
      });
    }).catchError((error) {});
  }
}
