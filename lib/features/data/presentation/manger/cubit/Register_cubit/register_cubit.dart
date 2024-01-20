import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/Register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  void userRegister(
      {required String username,
      required String email,
      required String password}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);

      emit(RegisterSuccesState());
    }).catchError((error) {
      emit(RegisterErrorState(error: error.toString()));
    });
  }

  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) {
    return BlocProvider.of(context);
  }
}
