import 'package:makdad_app/features/data/models/user_model.dart';

abstract class SocialState {}

class SocialIntialState extends SocialState {}

//Get user data
class SocialGetUserLoadinState extends SocialState {}

class SocialGetUserSuccesState extends SocialState {
  final UserModel model;

  SocialGetUserSuccesState({required this.model});
}

class SocialGetUserErrorState extends SocialState {
  final String error;

  SocialGetUserErrorState({required this.error});
}

//Get All user data
class SocialGetALLUserLoadinState extends SocialState {}

class SocialGetALLUserSuccesState extends SocialState {}

class SocialGetALLUserErrorState extends SocialState {
  final String error;

  SocialGetALLUserErrorState({required this.error});
}
//Get All Comment
class SocialGetALLCommentLoadinState extends SocialState {}

class SocialGetALLCommentSuccesState extends SocialState {}

class SocialGetALLCommentErrorState extends SocialState {
  final String error;

  SocialGetALLCommentErrorState({required this.error});
}

//Bottom navigation bar
class SocialChangeBottomNavState extends SocialState {}

class SocialNewPostBottomNavState extends SocialState {}

//Picked profile Photo
class SocialPickedProfileImageSuccesState extends SocialState {}

class SocialPickedProfileImageErrorState extends SocialState {}

//Picked Cover Photo
class SocialPickedCoverImageSuccesState extends SocialState {}

class SocialPickedCoverImageErrorState extends SocialState {}

class SocialUploadProfileImageSuccesState extends SocialState {}

class SocialUploadProfileImageErrorState extends SocialState {}

class SocialUploadCoverImageSuccesState extends SocialState {}

class SocialUploadCoverImageErrorState extends SocialState {}
//userUpdate State

class SocialUserUpdateErrorState extends SocialState {}

class SocialUserUpdateLoadingState extends SocialState {}

//Create Post States
class SocialCreatePostLoadingState extends SocialState {}

class SocialCreatePostSuccesState extends SocialState {}

class SocialCreatePostErrorState extends SocialState {}

//post image
class SocialPickedPostImageSuccesState extends SocialState {}

class SocialPickedPostImageErrorState extends SocialState {}

class SocialRemovePostImageState extends SocialState {}

//Get post
class SocialGetPostsLoadinState extends SocialState {}

class SocialGetPostsSuccesState extends SocialState {}

class SocialGetPostsErrorState extends SocialState {
  final String error;

  SocialGetPostsErrorState({required this.error});
}

//Posts Like
class SocialLikePostsSuccesState extends SocialState {}

class SocialLikePostsErrorState extends SocialState {
  final String error;

  SocialLikePostsErrorState({required this.error});
}

//
class SocialCommentPostsSuccesState extends SocialState {}

class SocialCommentPostsErrorState extends SocialState {
  final String error;

  SocialCommentPostsErrorState({required this.error});
}
