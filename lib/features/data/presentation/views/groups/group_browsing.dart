import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';

class GroupBrowsing extends StatelessWidget {
  const GroupBrowsing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Browse',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            Spacer(),
          ],
        ),
        Text(
          'Look for groups of interset by topics',
          style: TextStyle(color: Colors.black.withOpacity(0.5)),
        ),
        Row(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black26),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/lovely-pet-portrait-isolated_23-2149192347.jpg?w=360&t=st=1711459625~exp=1711460225~hmac=eede655f3fd931ce0f482022c75d62ca2e653531fe03cef24943502fe33a6b6d',
                  ),
                ),
                borderRadius: BorderRadius.circular(16),
                //color: defaulColor,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Animals',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                ),
                const Text('Adorable Cats',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
                Text('235 Memebers',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w500))
              ],
            )
          ],
        )
      ],
    );
  }
}
