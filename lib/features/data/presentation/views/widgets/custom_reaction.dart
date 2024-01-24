import 'package:flutter/material.dart';

class CustomReaction extends StatelessWidget {
  const CustomReaction({
    super.key,
    required this.icon,
    this.color = Colors.red,
    required this.text, this.onTap,
  });
  final IconData icon;
  final Color? color;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 16,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
