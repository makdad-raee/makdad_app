import 'package:flutter/material.dart';

class GroupBrowsing extends StatelessWidget {
  const GroupBrowsing({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
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
      ],
    );
  }
}