import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }
}
