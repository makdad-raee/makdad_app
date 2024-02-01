import 'package:makdad_app/features/data/models/user_model.dart';

abstract class SocialState {}

class SocialIntialState extends SocialState {}

class SocialGetUserLoadinState extends SocialState {}

class SocialGetUserSuccesState extends SocialState {
  final UserModel model;

  SocialGetUserSuccesState({required this.model});
}

class SocialGetUserErrorState extends SocialState {
  final String error;

  SocialGetUserErrorState({required this.error});
}

class SocialChangeBottomNavState extends SocialState {}

class SocialNewPostBottomNavState extends SocialState {}

class SocialPickedProfileImageSuccesState extends SocialState {}

class SocialPickedProfileImageErrorState extends SocialState {}

class SocialPickedCoverImageSuccesState extends SocialState {}

class SocialPickedCoverImageErrorState extends SocialState {}

class SocialUploadProfileImageSuccesState extends SocialState {}

class SocialUploadProfileImageErrorState extends SocialState {}

class SocialUploadCoverImageSuccesState extends SocialState {}

class SocialUploadCoverImageErrorState extends SocialState {}

class SocialUserUpdateErrorState extends SocialState {}

class SocialUserUpdateLoadingState extends SocialState {}
