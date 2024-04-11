import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';

class CreateGroupFormFields extends StatelessWidget {
  const CreateGroupFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create Group',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            const DefaultTextFoemFieldForGroups(hintText: ' Name of the group'),
            const SizedBox(
              height: 24,
            ),
            const DefaultTextFoemFieldForGroups(
                suffixIcon: Icon(Icons.type_specimen_rounded),
                hintText: ' Type of the Group'),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  color: defaulColor, borderRadius: BorderRadius.circular(8)),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Create Group',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class DefaultTextFoemFieldForGroups extends StatelessWidget {
  const DefaultTextFoemFieldForGroups({
    super.key,
    required this.hintText,
    this.suffixIcon,
  });
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon ?? const Icon(Icons.person),
        fillColor: defaulColor,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: defaulColor),
            borderRadius: BorderRadius.circular(16)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
