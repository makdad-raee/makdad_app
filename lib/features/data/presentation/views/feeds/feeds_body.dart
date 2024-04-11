import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/build_bost_item.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/story_and_write_post_view.dart';

class FeedsBody extends StatelessWidget {
  const FeedsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ;
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var listPosts = SocialCubit.get(context).posts;
        var userModel = SocialCubit.get(context).usermodel;

        return Column(
          children: [
            StoryAndWritePostView(userModel: userModel),
            listPosts.isEmpty
                ? Center(child: defaultIndicator())
                : ListView.builder(

                    //  controller: ScrollController(),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listPosts.length,
                    itemBuilder: (context, child) => BuildPostItem(
                          postModel: listPosts[child],
                          userModel: userModel,
                          index: child,
                        )),
          ],
        );
      },
    );
  }
}
