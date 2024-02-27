import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/post_model.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/comments/comments_screen.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/avatar_name_and_more.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/custom_reaction.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/diveder.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/hash_tag.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/photo_of_the_post.dart';

class BuildPostItem extends StatelessWidget {
  const BuildPostItem({
    super.key,
    required this.postModel,
    required this.userModel,
    required this.index,
  });
  final PostModel postModel;
  final UserModel userModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialCubit, SocialState>(
      builder: (context, state) {
        return Column(
          children: [
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(8),
              elevation: 5,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AvatarNameAndMore(
                          name: postModel.name,
                          profileImage: postModel.image,
                          dateTime: postModel.dateTime.toString()),
                    ),
                    const Diveder(),
                    Text(
                      postModel.postText ?? '',
                      style: style16.copyWith(height: 1.3),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          children: [
                            HashTag(),
                          ],
                        ),
                      ),
                    ),
                    if (postModel.postImage != '')
                      PhotoOfThePost(photoPost: postModel.postImage),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: CustomReaction(
                                text:
                                    '${SocialCubit.get(context).likesCount[index]}',
                                icon: FontAwesomeIcons.heart,
                              )),
                          const Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: Expanded(
                              child: CustomReaction(
                                  icon: FontAwesomeIcons.comment,
                                  color: Colors.amber,
                                  text:
                                      '${SocialCubit.get(context).commentCount[index]} comments'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Diveder(),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              SocialCubit.get(context).getComments(postId: SocialCubit.get(context).postId[index]);
                            //  SocialCubit.get(context).getAllComments(
                                  //postId:
                                    //  SocialCubit.get(context).postId[index]);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>  CommentsScreen(
                                  postModel: postModel,
                                    index1: index
                                    ),
                              ));
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundImage:
                                      NetworkImage(userModel.image ?? ''),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Write a Comment ... ',
                                  style: style12,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            SocialCubit.get(context).likePost(
                                SocialCubit.get(context).postId[index]);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.red,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Like',
                                style: style14.copyWith(
                                    color: const Color.fromARGB(
                                        255, 113, 111, 111)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
