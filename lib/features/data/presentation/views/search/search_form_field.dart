import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: defaulColor,
        decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search, color: defaulColor),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: defaulColor),
                borderRadius: BorderRadius.circular(16)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.black45)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: defaulColor))),
      ),
    );
  }
}
