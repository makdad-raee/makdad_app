import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';

class FriendRecivedRequest extends StatelessWidget {
  const FriendRecivedRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SocialCubit.get(context).getReciverFreindRequest();
      return BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SocialCubit.get(context);
          return Scaffold(
            appBar: defaultAppar(
                context: context, title: 'Friends Recived Request'),
            body: ListView.builder(
              itemCount: cubit.reciverFreindsRequest.length,
              itemBuilder: (context, index) => FriendsRecivedRequestItem(
                  onPressed: () {
                    SocialCubit.get(context).applyFriendRequest(
                        userModelWhoSendRequest:
                            cubit.reciverFreindsRequest[index]);
                  },
                  userModel: cubit.reciverFreindsRequest[index]),
            ),
          );
        },
      );
    });
  }
}

class FriendsRecivedRequestItem extends StatelessWidget {
  const FriendsRecivedRequestItem(
      {super.key, required this.userModel, required this.onPressed});
  final UserModel userModel;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {},
        builder: (context, state) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(userModel.image!),
                        radius: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        userModel.name!,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: defaulColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: TextButton(
                              onPressed: onPressed,
                              child: const Text(
                                'Apply  ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: defaulColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                ' Delete',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
