import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/chats/chat_details.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/diveder.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) => SocialCubit.get(context).users.isNotEmpty
          ? ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ChatNameAndimImageUser(
                  usermodel: SocialCubit.get(context).users[index]),
              separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Diveder(),
                  ),
              itemCount: SocialCubit.get(context).users.length)
          : Center(child: defaultIndicator()),
    );
  }
}

class ChatNameAndimImageUser extends StatelessWidget {
  const ChatNameAndimImageUser({super.key, required this.usermodel});
  final UserModel usermodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatDetails(userModel: usermodel),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(usermodel.image!),
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
                        usermodel.name!,
                        style: style18.copyWith(height: 1.4),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const SizedBox(),
                      const Icon(
                        FontAwesomeIcons.solidCircleCheck,
                        color: Colors.blue,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
