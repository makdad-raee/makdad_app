import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';

class FriendRequest extends StatelessWidget {
  const FriendRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SocialCubit.get(context).getsendFreindRequest();
        return BlocConsumer<SocialCubit, SocialState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SocialCubit.get(context);
            var userModel = SocialCubit.get(context).sendFreindsRequest;
            return Scaffold(
                appBar:
                    defaultAppar(context: context, title: 'Send Friend Request'),
                body:
                    // userModel.isNotEmpty?
                    ListView.builder(
                  itemCount: userModel.length,
                  itemBuilder: (context, index) =>
                      FriendRequestItem(userModel: userModel[index]),
                ));
          },
        );
      }
    );
  }
}

class FriendRequestItem extends StatelessWidget {
  const FriendRequestItem({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: defaulColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Cancel ',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
