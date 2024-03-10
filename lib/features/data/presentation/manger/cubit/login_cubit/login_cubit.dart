import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  void login({required String email, required String password}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
         // print(value.user!.email);
         // print(value.user!.uid);
      emit(LoginSuccesState(uId: value.user!.uid));
    }).catchError((error) {
      emit(LoginErrorState(error: error.toString()));
    });
  }

  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }
}
