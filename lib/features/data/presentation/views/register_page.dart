import 'package:flutter/material.dart';
import 'package:makdad_app/features/data/presentation/views/home_views.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const RegisterBody(),
    );
  }
}

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
            const CustomTExtFormField(
                hintText: 'USer Name', icon: Icons.person),
            SizedBox(
              height: height * 0.03,
            ),
            const CustomTExtFormField(hintText: 'Email', icon: Icons.mail),
            SizedBox(
              height: height * 0.03,
            ),
            const CustomTExtFormField(hintText: 'Password', icon: Icons.lock),
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
                    onPressed: () {},
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
    );
  }
}
