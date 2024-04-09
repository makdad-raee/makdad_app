import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/views/Notification%20Bell/open_notification.dart';

class NotificationBellView extends StatelessWidget {
  const NotificationBellView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notification',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
        ),
      ),
      body:  Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OpenNotIfication(),));
            },
            child: const LikeNotification()),
          InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OpenNotIfication(),));
          },
            child: const MentionNotification()),
        ],
      ),
    );
  }
}

class LikeNotification extends StatelessWidget {
  const LikeNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              "https://img.freepik.com/free-photo/portrait-beautiful-smiling-blond-model-dressed-summer-hipster-clothes-trendy-girl-posing-street-background-funny-positive-woman_158538-5479.jpg?size=626&ext=jpg&ga=GA1.1.1667027219.1706042622&semt=ais"),
        ),
        const SizedBox(
          width: 15,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Carla Washigton',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(' Liked Your Post', style: TextStyle(fontSize: 12)),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/art-meeting.appspot.com/o/users%2Freceived_1568269073705778.jpg?alt=media&token=ddb03651-6d13-42af-b317-2c3a10f3dc47'))),
          ),
        )
      ],
    );
  }
}

class MentionNotification extends StatelessWidget {
  const MentionNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              "https://img.freepik.com/free-photo/front-view-beautiful-woman_23-2148574859.jpg?t=st=1712681983~exp=1712685583~hmac=e283e11cc402157737de24b4def8c4f72908452d114134e4fc844d91d5705b96&w=740"),
        ),
        const SizedBox(
          width: 15,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Angel N Prosto ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(' Mentioned You in a Post', style: TextStyle(fontSize: 12)),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://img.freepik.com/free-photo/mom-spending-time-with-kid-beach_23-2150924951.jpg?t=st=1712682041~exp=1712685641~hmac=9eec6910a0b0459b21a6e1696a958702803439878b538e58a44849d598fa3187&w=360'))),
          ),
        )
      ],
    );
  }
}
