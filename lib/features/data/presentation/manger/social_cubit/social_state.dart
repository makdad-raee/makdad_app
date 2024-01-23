abstract class SocialState {}

class SocialIntialState extends SocialState {}

class SocialGetUserLoadinState extends SocialState {}

class SocialGetUserSuccesState extends SocialState {}

class SocialGetUserErrorState extends SocialState {
  final String error;

  SocialGetUserErrorState({required this.error});
}
class SocialCjangeBottomNav extends SocialState{}