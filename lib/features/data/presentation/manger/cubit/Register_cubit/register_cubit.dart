import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/Register_cubit/register_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterCubit extends Cubit<RegisterState> {
  void userRegister(
      {required String username,
      required String email,
      required String password,
      required String phone}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUserInCloud(
        name: username,
        email: email,
        password: password,
        phone: phone,
        uId: value.user!.uid,
      );

      // emit(RegisterSuccesState());
    }).catchError((error) {
      emit(RegisterErrorState(error: error.toString()));
    });
  }

  void createUserInCloud(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String uId}) {
    UserModel model =
        UserModel(email: email, name: name, phone: phone, uId: uId,isEmailVerfied: false);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccesState());
    }).catchError((error) {
      emit(CreateUserErrorState(error: error.toString()));
    });
  }

  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) {
    return BlocProvider.of(context);
  }
}
