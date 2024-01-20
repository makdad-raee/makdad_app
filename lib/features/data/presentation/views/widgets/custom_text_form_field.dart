import 'package:flutter/material.dart';

class CustomTExtFormField extends StatelessWidget {
  const CustomTExtFormField(
      {super.key,
      required this.hintText,
      required this.icon,
      this.textInputType = TextInputType.text, this.suffixIcon, this.controller,  this.obscureText=false});
  final String hintText;
  final IconData icon;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      
      validator: (value) {
        if(value!.isEmpty){
          return 'must not be empty';

        }
        return null;
        
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon:suffixIcon ,
        prefixIcon: Icon(icon),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
