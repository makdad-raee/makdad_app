import 'package:flutter/material.dart';
import 'package:makdad_app/features/data/presentation/views/register_page.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/custom_text_form_field.dart';

class LoginTo extends StatelessWidget {
  const LoginTo({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var emailController=TextEditingController();
    var passwordcontroller=TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'LOGIN ',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500
                //color: Color.fromARGB(255, 116, 115, 115),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
             CustomTExtFormField(
              controller: emailController,
              hintText: 'Your Email',
              icon: Icons.mail,
            ),
            SizedBox(
              height: height * 0.03,
            ),
             CustomTExtFormField(
              controller: passwordcontroller,
              hintText: 'Password',
              icon: Icons.lock,
            ),
            SizedBox(height: height*0.03,),
            Row(
              children: [
                const Text('Forget Paasword ??'),
                const Spacer(),
                IconButton(
                  onPressed: () {},
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
    );
  }
}
