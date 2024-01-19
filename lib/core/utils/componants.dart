import 'package:flutter/material.dart';

const defaulColor = Colors.green;

Widget defaultTextbutton({
  required String? text,
  required void Function()? onPressed,
  Color color = Colors.green,
}) {
  return Container(
    width: double.infinity,
    height: 55,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}

Widget defaulatTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String hinttext,
  required Widget prefixIcon,
  required String? Function(String?)? validator,
  bool ispassword = false,
  Widget? sufixIcon,
}) {
  return TextFormField(
    validator: validator,
    keyboardType: type,
    controller: controller,
    decoration: InputDecoration(
      hintText: hinttext,
      prefixIcon: prefixIcon,
      suffixIcon: sufixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
