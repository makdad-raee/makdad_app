import 'package:flutter/material.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/feeds_body.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics:BouncingScrollPhysics(),
      child: FeedsBody(),
    );
  }
}
