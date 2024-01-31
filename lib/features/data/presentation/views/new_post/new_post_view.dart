import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppar(context: context, title: 'Add post',),
    );
  }
}
