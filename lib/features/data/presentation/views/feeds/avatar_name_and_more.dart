import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/post_model.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/users/userdetails.dart';

class AvatarNameAndMore extends StatelessWidget {
  const AvatarNameAndMore({
    super.key,
    this.isCreate = false,
    this.name,
    this.profileImage,
    this.dateTime,
    required this.userModel,  required this.postModel,
  });
  final String? name;
  final String? profileImage;
  final String? dateTime;

  final bool isCreate;
  final UserModel userModel;
  final PostModel postModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) => Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserDetailsProfile(userModel: userModel,postModel:postModel! ),
              ));
              //bloccc remender
              //getuserpostsa
              SocialCubit.get(context).getuservisitposts(uid: userModel.uId!);
            },
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(profileImage ?? ''),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name ?? '',
                      style: style18!.copyWith(height: 1.4),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    isCreate
                        ? const SizedBox()
                        : const Icon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.blue,
                            size: 18,
                          ),
                  ],
                ),
                isCreate
                    ? const Text(
                        'Public',
                        style: TextStyle(
                            color: Color.fromARGB(255, 112, 108, 108)),
                      )
                    : Text(
                        dateTime ?? '',
                        style: style12!.copyWith(height: 1.4),
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          !isCreate
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
