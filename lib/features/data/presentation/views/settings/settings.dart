import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/settings/edit_profile.dart';
import 'package:makdad_app/features/data/presentation/views/settings/photos_flowers_posts_row.dart';
import 'package:makdad_app/features/data/presentation/views/settings/profile_pic_bio_name.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context).usermodel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProfilePicAndNameAndBio(
                name: cubit.name!,
                coverImage: cubit.coverImage,
                bio: cubit.bio,
                profileImage: cubit.image,
              ),
              const PhotosFlowersPostsCounter(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ))),
                      child: const Text(
                        'Add Photos',
                        style: TextStyle(color: defaulColor),
                      ),
                      onPressed: () {
                        SocialCubit.get(context).sendMessageNoti(title: 'tryyy', messagge: 'tryyy2');
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
              )
            ],
          ),
        );
      },
    );
  }
}
