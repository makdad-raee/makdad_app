import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/avatar_name_and_more.dart';
import 'package:makdad_app/features/data/presentation/views/settings/edit_profile.dart';
import 'package:makdad_app/features/data/presentation/views/settings/photos_flowers_posts_row.dart';
import 'package:makdad_app/features/data/presentation/views/settings/profile_pic_bio_name.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/custom_reaction.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/diveder.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/hash_tag.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/photo_of_the_post.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubitUserModel = SocialCubit.get(context).usermodel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfilePicAndNameAndBio(
                  name: cubitUserModel.name!,
                  coverImage: cubitUserModel.coverImage,
                  bio: cubitUserModel.bio,
                  profileImage: cubitUserModel.image,
                ),
                const PhotosFlowersPostsCounter(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ))),
                        child: const Text(
                          'Add Photos',
                          style: TextStyle(color: defaulColor),
                        ),
                        onPressed: () {
                          // SocialCubit.get(context).sendMessageNoti(title: 'tryyy', messagge: 'tryyy2');
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ))),
                      child: const Icon(
                        FontAwesomeIcons.penToSquare,
                        color: defaulColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditProfileView(),
                        ));
                      },
                    )
                  ],
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        AvatarNameAndMore(
                          name: cubitUserModel.name,
                          profileImage: cubitUserModel.image,
                          dateTime: DateTime.now().toString(),
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
                        // if (postModel.postImage != '')
                        PhotoOfThePost(photoPost: cubitUserModel.image
                            // postModel.postImage
                            ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomReaction(
                                    text: ''
                                    // '${SocialCubit.get(context).likesCount[index]
                                    // }',
                                    ,
                                    icon: FontAwesomeIcons.heart,
                                  )),
                              Spacer(),
                              Align(
                                alignment: Alignment.topRight,
                                child: Expanded(
                                  child: CustomReaction(
                                      icon: FontAwesomeIcons.comment,
                                      color: Colors.amber,
                                      text:
                                          // '${SocialCubit.get(context).commentCount[index]}
                                          'comments'),
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
                                  // SocialCubit.get(context).getComments(
                                  //     postId:
                                  //         SocialCubit.get(context).postId[index]);

                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) => CommentsScreen(
                                  //       postModel: postModel, index1: index),
                                  // ));
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundImage: NetworkImage(
                                          cubitUserModel.image ?? ''),
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
                                // SocialCubit.get(context).likePost(
                                //     SocialCubit.get(context).postId[index]);
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
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
