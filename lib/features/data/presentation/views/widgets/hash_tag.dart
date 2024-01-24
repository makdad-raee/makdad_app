import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';

class HashTag extends StatelessWidget {
  const HashTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        height: 25,
        child: MaterialButton(
          minWidth: 1,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            '#software',
            style: TextStyle(color: defaulColor),
          ),
        ),
      ),
    );
  }
}
