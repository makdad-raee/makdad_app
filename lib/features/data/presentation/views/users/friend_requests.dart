import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';

class FriendRequest extends StatelessWidget {
  const FriendRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppar(context: context, title: 'Send Friend Request'),
      body: const FriendRequestItem(),
    );
  }
}

class FriendRequestItem extends StatelessWidget {
  const FriendRequestItem({
    super.key,
  });

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
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Hasan hasan',
                      style: TextStyle(fontSize: 20),
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
