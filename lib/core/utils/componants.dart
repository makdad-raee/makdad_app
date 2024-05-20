import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const defaulColor = Colors.green;

Widget defaultTextbutton({
  required String? text,
  required void Function()? onPressed,
  Color color = Colors.green,
}) {
  return Container(
    width: double.infinity,
    height: 40,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: const TextStyle(color: Colors.white, fontSize: 18),
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

void showToast({
  required String msg,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: choosToastColor(state: state),
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16.0,
    );

enum ToastState { succes, error, warning }

Color choosToastColor({required ToastState state}) {
  Color color;
  switch (state) {
    case ToastState.succes:
      color = Colors.green;
      break;

    case ToastState.error:
      color = Colors.red;
      break;

    case ToastState.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

PreferredSizeWidget? defaultAppar({
  required BuildContext context,
  String? title,
  List<Widget>? action,
}) =>
    AppBar(
      title: Text(title!),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(FontAwesomeIcons.angleLeft)),
      actions: action,
    );
Widget defaultIndicator() => const CircularProgressIndicator(
      color: defaulColor,
    );
