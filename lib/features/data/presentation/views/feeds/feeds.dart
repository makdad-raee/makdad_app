import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/feeds_body.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() {
      //SocialCubit.get(context).getPosts();
      return Future.delayed(const Duration(seconds: 3));
    }

    return RefreshIndicator(
      color: defaultColor,
      onRefresh: onRefresh,
      child: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: FeedsBody(),
      ),
    );
  }
}
