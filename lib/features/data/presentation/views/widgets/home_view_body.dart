import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/login_cubit/login_cubit.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/login_to_page.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key,});
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: const LoginTo(),
      ),
    );
  }
}
