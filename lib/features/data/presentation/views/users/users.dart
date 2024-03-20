import 'package:flutter/material.dart';
import 'package:makdad_app/features/data/presentation/views/users/friend_requests.dart';
import 'package:makdad_app/features/data/presentation/views/users/recived_friend_request.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FriendRequest(),
              ));
            },
            child: const Text('Requests have been send')),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FriendRecivedRequest(),
              ));
            },
            child: const Text('Requests have been Recive')),
      ],
    );
  }
}
