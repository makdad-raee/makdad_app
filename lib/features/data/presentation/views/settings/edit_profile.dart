import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/settings/profile_pic_bio_name.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var bioController = TextEditingController();

    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userMode = SocialCubit.get(context).usermodel;
        return Scaffold(
          appBar:
              defaultAppar(context: context, title: 'Edit profile', action: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(color: defaulColor, fontSize: 18),
                ),
              ),
            ),
          ]),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ProfilePicAndNameAndBio(
                  name: userMode.name!,
                  coverImage: userMode.coverImage,
                  bio: userMode.bio,
                  profileImage: userMode.image,
                  isEditView: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                defaulatTextFormField(
                  controller: nameController,
                  type: TextInputType.name,
                  hinttext: 'Name',
                  prefixIcon: const Icon(FontAwesomeIcons.user),
                  validator: (value) {
                    if (value == null) {
                      return 'name must\t be empty';
                    }
                    return '';
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                defaulatTextFormField(
                  controller: nameController,
                  type: TextInputType.text,
                  hinttext: 'Bio',
                  prefixIcon: const Icon(FontAwesomeIcons.circleInfo),
                  validator: (value) {
                    if (value == null) {
                      return 'bio must\'t be empty';
                    }
                    return '';
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
