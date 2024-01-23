abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccesState extends LoginState {
  final String uId;

  LoginSuccesState({required this.uId});
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});
}
