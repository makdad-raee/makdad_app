import 'package:flutter/material.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/login_to_page.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: LoginTo(),
    );
  }
}
