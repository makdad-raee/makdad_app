import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/post_model.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/build_bost_item.dart';
import 'package:makdad_app/features/data/presentation/views/settings/profile_pic_bio_name.dart';

class UserDetailsProfile extends StatelessWidget {
  const UserDetailsProfile(
      {super.key, required this.userModel, required this.postModel});
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
                const FlowersAndUserCount(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: AddFriendANdMessages(),
                ),
                SizedBox(
                  height: 12,
                ),
                const VisitedUserInformation(),
                listofvisituserspost.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => BuildPostItem(
                            postModel: listofvisituserspost[index],
                            userModel: userModel,
                            index: index),
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

class FlowersAndUserCount extends StatelessWidget {
  const FlowersAndUserCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const Text(
              '2.8k ',
              style: style18,
            ),
            Text(
              'Followers',
              style: style16.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              '2.8k ',
              style: style18,
            ),
            Text(
              'Friends',
              style: style16.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}

class AddFriendANdMessages extends StatelessWidget {
  const AddFriendANdMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            // width: 80,
            decoration: BoxDecoration(
                color: defaulColor, borderRadius: BorderRadius.circular(24)),
            child: const Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  FontAwesomeIcons.userPlus,
                  color: Colors.white,
                ),
                Text(
                  'Add Friend',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            )),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            height: 50,
            // width: 80,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(24)),
            child: const Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(FontAwesomeIcons.commentDots),
                Text(
                  'Messages',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            )),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300]),
            child: Center(
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            )),

        //
      ],
    );
  }
}

class VisitedUserInformation extends StatelessWidget {
  const VisitedUserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                    const Text(
                      'From',
                      style: style18,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text('Syria , Lattakia',
                        style: style16.copyWith(fontWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text('Hasan Hayek', style: style18),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text('See full Hasan Hayek \'s about info',
                        style: style16.copyWith(fontWeight: FontWeight.w500)),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Friends',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                  ),
                  Text('804 , 23 Mutual Friends',style: TextStyle(color: Colors.grey,))
                ],
              ),
              const Spacer(),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Center(
                      child: Text(
                    'See all Friends',
                    style: TextStyle(fontSize: 16),
                  )),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
