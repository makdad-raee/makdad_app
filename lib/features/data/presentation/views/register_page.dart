import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/Register_cubit/register_cubit.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<RegisterCubit>(
        create: (context) => RegisterCubit(),
        child: const RegisterBody(),
      ),
    );
  }
}
