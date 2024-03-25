import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/views/users/friend_requests.dart';
import 'package:makdad_app/features/data/presentation/views/users/recived_friend_request.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

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
                    onPressed: () {},
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
            const SuggestedForYou()
          ],
        ),
      ),
    );
  }
}

class SuggestedForYou extends StatelessWidget {
  const SuggestedForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: 200,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/fit-blond-woman-with-perfect-smile-stylish-sportswear-looking-camera-holding-bottle-water-white-wall-demonstrate-muscles_273443-4534.jpg?size=626&ext=jpg&ga=GA1.1.1667027219.1706042622&semt=sph'),
                      fit: BoxFit.cover),
                  // color: defaulColor,
                  borderRadius: BorderRadiusDirectional.circular(20)),
            ),
            Text(
              'Health',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Healthy LifeStyle',
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        itemCount: 10,
      ),
    );
  }
}

class MostActiveGroupsItem extends StatelessWidget {
  const MostActiveGroupsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          // height: 100,
          width: 150,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/premium-photo/fresh-vegetables-herbs-as-background_188078-30922.jpg?size=626&ext=jpg'),
                  fit: BoxFit.cover),
              //  / color: defaulColor,
              borderRadius: BorderRadiusDirectional.circular(20)),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Health parners',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '31K Memebers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ],
    );
  }
}
