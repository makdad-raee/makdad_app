import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/comment_model.dart';
import 'package:makdad_app/features/data/models/post_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen(
      {super.key, required this.postModel, required this.index1});
  final PostModel postModel;
  final int index1;

  @override
  Widget build(BuildContext context) {
    var commentController = TextEditingController();
    SocialCubit.get(context)
        .getComments(postId: SocialCubit.get(context).postId[index1]);
    return Builder(builder: (context) {
      return BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: defaultAppar(context: context, title: 'Comments'),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SocialCubit.get(context).comments.isNotEmpty
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomCommentItem(
                              commentModel:
                                  SocialCubit.get(context).comments[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 12,
                              ),
                          itemCount: SocialCubit.get(context).comments.length)
                      : const Center(child: Text('No comment yet')),
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]!, width: 1),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextFormField(
                            controller: commentController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'type your comment...'),
                          ),
                        ),
                      ),
                      Container(
                        color: defaultColor.withOpacity(0.8),
                        child: TextButton(
                            onPressed: () {
                              SocialCubit.get(context).sendComment(
                                  postId:
                                      SocialCubit.get(context).postId[index1],
                                  commentText: commentController.text,
                                  postModel: postModel);
                                  commentController.text='';
                            },
                            child: const Text(
                              'Comment',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class CustomCommentItem extends StatelessWidget {
  const CustomCommentItem({super.key, required this.commentModel});
  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(commentModel.image!),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 210, 210),
                        borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            commentModel.name!,
                            style: style16,
                          ),
                          Text(
                            commentModel.commentText!,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Now'),
                        SizedBox(
                          width: 18,
                        ),
                        Text('Like'),
                        SizedBox(
                          width: 18,
                        ),
                        Text('Reply')
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
