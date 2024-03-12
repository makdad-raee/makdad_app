import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/message_model.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    var messageController = TextEditingController();
    return Builder(builder: (context) {
      SocialCubit.get(context).getMessages(reciverId: userModel.uId!);
      return BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(userModel.image!),
                ),
                const SizedBox(width: 12),
                Text(userModel.name!),
              ],
            ),
          ),
          body:// SocialCubit.get(context).messages.isNotEmpty?
              
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SocialCubit.get(context).messages.isNotEmpty ?ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var message =
                                  SocialCubit.get(context).messages[index];
                              if (SocialCubit.get(context).usermodel.uId ==
                                  message.senderID) {
                                return BuildMyMessage(
                                  messageModel: message,
                                );
                              } else {
                                return BuildFriendMessage(
                                    messageModel: message);
                              }
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 12,
                                ),
                            itemCount:
                                SocialCubit.get(context).messages.length):const CircularProgressIndicator(),
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[400]!, width: 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: TextFormField(
                                  controller: messageController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'type your message...'),
                                ),
                              ),
                            ),
                            Container(
                              color: defaultColor.withOpacity(0.8),
                              child: TextButton(
                                  onPressed: () {
                                    SocialCubit.get(context).sendMessage(
                                        textMessge: messageController.text,
                                        reciverId: userModel.uId!,
                                        dateTime: DateTime.now().toString());
                                    messageController.text = '';
                                  },
                                  child: const Text(
                                    'send',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              // : const Center(
              //     child: CircularProgressIndicator(),
              //   ),
        ),
      );
    });
  }
}

class BuildFriendMessage extends StatelessWidget {
  const BuildFriendMessage({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(chatRadiusCirculer),
                topLeft: Radius.circular(chatRadiusCirculer),
                topRight: Radius.circular(chatRadiusCirculer),
              )),
          child: Text(messageModel.textMessge!)),
    );
  }
}

class BuildMyMessage extends StatelessWidget {
  const BuildMyMessage({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 139, 208, 158),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(chatRadiusCirculer),
                topLeft: Radius.circular(chatRadiusCirculer),
                topRight: Radius.circular(chatRadiusCirculer),
              )),
          child: Text(messageModel.textMessge!)),
    );
  }
}
