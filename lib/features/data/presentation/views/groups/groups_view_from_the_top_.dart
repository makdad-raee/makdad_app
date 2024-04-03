import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/page_model.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/views/groups/main_groups_view.dart';
import 'package:makdad_app/features/data/presentation/views/groups/most_active_groups.dart';
import 'package:makdad_app/features/data/presentation/views/groups/suggested_groups_to_you.dart';
import 'package:makdad_app/features/data/presentation/views/users/friend_requests.dart';
import 'package:makdad_app/features/data/presentation/views/users/recived_friend_request.dart';

class GroupsViewFromTop extends StatelessWidget {
  const GroupsViewFromTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            TextButton(
                onPressed: () {
                  SocialCubit.get(context).createPage(
                    name: 'new page',
                  );
                },
                child: const Text('Create page')),
            TextButton(
                onPressed: () {
                  SocialCubit.get(context).addMemberToPage(
                      member: UserModel(name: 'hooooooo'),
                      pageModel: PageModel(
                          name: 'new page',
                          uId: uId,
                          pageOwner: SocialCubit.get(context).usermodel));
                },
                child: const Text('Add members')),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Explored ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Your Group ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Container(
                width: double.infinity,
                height: 2,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                const Text(
                  'Popular ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MainGroupsView(),
                      ));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 28,
                    ))
              ],
            ),
            Text(
              'The most active groups in the community',
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            SizedBox(
              height: 220,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 8,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => const MostActiveGroupsItem(),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Suggested For You ',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 28,
                        )),
                  ],
                ),
                Text(
                  'Based on another groups you\'re part of',
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            const SuggestedGroupForYou()
          ],
        ),
      ),
    );
  }
}