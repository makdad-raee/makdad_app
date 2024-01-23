import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/cashe_helper.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/login_cubit/login_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/cubit/login_cubit/login_state.dart';
import 'package:makdad_app/features/data/presentation/views/register_page.dart';
import 'package:makdad_app/features/data/presentation/views/social_home_view.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/custom_text_form_field.dart';

class LoginTo extends StatefulWidget {
  const LoginTo({super.key});

  @override
  State<LoginTo> createState() => _LoginToState();
}

class _LoginToState extends State<LoginTo> {
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    var emailController = TextEditingController();
    var passwordcontroller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccesState) {
              showToast(msg: 'Success', state: ToastState.succes);
              CasheHelper.saveDate(key: 'uId', value: state.uId)
                  .then((value) {})
                  .catchError((error) {});
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const SocialHomeView(),
                ),
              );
            }
            if (state is LoginErrorState) {
              showToast(msg: 'Error Login', state: ToastState.error);
            }
          },
          builder: (context, state) => Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LOGIN ',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500
                      //color: Color.fromARGB(255, 116, 115, 115),
                      ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomTExtFormField(
                  controller: emailController,
                  hintText: 'Your Email',
                  textInputType: TextInputType.emailAddress,
                  icon: Icons.mail,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomTExtFormField(
                  obscureText: true,
                  textInputType: TextInputType.visiblePassword,
                  controller: passwordcontroller,
                  hintText: 'Password',
                  icon: Icons.lock,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  children: [
                    const Text('Forget Paasword ??'),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          LoginCubit.get(context).login(
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
                  ],
                ),
                Row(
                  children: [
                    const Text('Don\'t have an account ?'),
                    const SizedBox(
                      height: 2,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.green),
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
