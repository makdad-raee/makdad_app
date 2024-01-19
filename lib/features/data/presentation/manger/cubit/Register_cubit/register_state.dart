abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccesState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState({required this.error});
}
