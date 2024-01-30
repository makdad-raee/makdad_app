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
class SocialChangeBottomNavState extends SocialState{}
class SocialNewPostBottomNavState extends SocialState{}