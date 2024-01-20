import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/Register_cubit/register_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/Register_cubit/register_state.dart';
import 'package:makdad_app/features/data/presentation/views/home_views.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/custom_text_form_field.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({
    super.key,
  });

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordcontroller = TextEditingController();
    var userNamecontroller = TextEditingController();
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) => Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomTExtFormField(
                    controller: userNamecontroller,
                    hintText: 'USer Name',
                    icon: Icons.person),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomTExtFormField(
                    controller: emailController,
                    hintText: 'Your Email',
                    icon: Icons.mail),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomTExtFormField(
                    controller: passwordcontroller,
                    hintText: 'Password',
                    textInputType: TextInputType.emailAddress,
                    icon: Icons.lock),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Text('Do you have an account?'),
                        const SizedBox(
                          height: 2,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomeView(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            RegisterCubit.get(context).userRegister(
                                username: userNamecontroller.text,
                                email: emailController.text,
                                password: passwordcontroller.text);
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_circle_right_rounded,
                          color: Colors.green,
                          size: 64,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
