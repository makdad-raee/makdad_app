import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/post_model.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/build_bost_item.dart';
import 'package:makdad_app/features/data/presentation/views/settings/profile_pic_bio_name.dart';
import 'package:makdad_app/features/data/presentation/views/settings/settings.dart';

class UserDetailsProfile extends StatelessWidget {
  const UserDetailsProfile({super.key, required this.userModel, required this.postModel});
  final UserModel userModel;
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var listofvisituserspost = SocialCubit.get(context).usersPosts;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ProfilePicAndNameAndBio(
                  name: userModel.name!,
                  bio: userModel.bio,
                  coverImage: userModel.coverImage,
                  profileImage: userModel.image,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          '2.8k ',
                          style: style16,
                        ),
                        Text(
                          'Followers',
                          style: style16,
                        ),
                      ],
                    ),
                    // Text(
                    //   '850 Friends',
                    //   style: style16,
                    // ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: AddFriendANdMessages(),
                ),
                listofvisituserspost.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>BuildPostItem(postModel: postModel, userModel: userModel, index: index),
                        //  Container(
                        //   height: 150,
                        //   width: 60,
                        //   color: Colors.red,
                        //   child: Text(postModel.postText!,style: const TextStyle(color: Colors.white),),
                        // ),
                        itemCount: listofvisituserspost.length,
                      )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
