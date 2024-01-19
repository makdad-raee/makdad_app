import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/Register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) {
    return BlocProvider.of(context);
  }
}
