import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/chats/chat_details.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                  height: 60,
                  child: Row(
                    children: [
                      const AddStoryFromChat(),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: ListView.separated(
                            //  physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                const ChatCircleWithOnlineDot(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 6),
                            itemCount: 10),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: SocialCubit.get(context).users.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                ChatNameAndimImageUser(
                                  lastMessage: SocialCubit.get(context).lastMessage,
                                    usermodel:
                                        SocialCubit.get(context).users[index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemCount: SocialCubit.get(context).users.length),
                      )
                    : Center(child: defaultIndicator()),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AddStoryFromChat extends StatelessWidget {
  const AddStoryFromChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 36,
          backgroundImage:
              NetworkImage(SocialCubit.get(context).usermodel.image!),
        ),
        const CircleAvatar(
            radius: 10, backgroundColor: Colors.white, child: Icon(Icons.add)),
      ],
    );
  }
}

class ChatCircleWithOnlineDot extends StatelessWidget {
  const ChatCircleWithOnlineDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 36,
          backgroundImage: NetworkImage(
              "https://img.freepik.com/free-photo/portrait-beautiful-smiling-blond-model-dressed-summer-hipster-clothes-trendy-girl-posing-street-background-funny-positive-woman_158538-5479.jpg?size=626&ext=jpg&ga=GA1.1.1667027219.1706042622&semt=ais"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
          child: CircleAvatar(
            radius: 6,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 5,
              backgroundColor: defaulColor,
            ),
          ),
        )
      ],
    );
  }
}

class ChatNameAndimImageUser extends StatelessWidget {
  const ChatNameAndimImageUser({super.key, required this.usermodel, required this.lastMessage});
  final UserModel usermodel;
  final String lastMessage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatDetails(userModel: usermodel),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 6,
          top: 8,
          right: 6,
        ),
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
                  Text(lastMessage)
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('9:24 Am')
          ],
        ),
      ),
    );
  }
}
