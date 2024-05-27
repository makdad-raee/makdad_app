import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';

class GroupsContainersKey extends StatelessWidget {
  const GroupsContainersKey({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 75,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: defaulColor.withOpacity(0.3)),
            child: const Row(
              children: [
                Icon(
                  Icons.group,
                  size: 26,
                  color: defaulColor,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '23',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: defaulColor),
                    ),
                    Text('Posts', style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: 75,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.pink.withOpacity(0.4)),
            child: const Row(
              children: [
                Icon(
                  Icons.person,
                  size: 26,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '45',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                    Text('Join Request',
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: 75,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.purple.withOpacity(0.4)),
            child: const Row(
              children: [
                Icon(
                  Icons.person,
                  size: 26,
                  color: Colors.purple,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '45',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.purple),
                    ),
                    Text('Join Request',
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

