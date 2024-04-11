import 'package:flutter/material.dart';

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
              border: Border.all(width: 1, color: Colors.black38),
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/free-photo/world-map-continent-global-support-graphic_53876-124649.jpg?t=st=1712682959~exp=1712686559~hmac=6e0c382de95f9e4bd700c5aeed54201e9baf1854e77b84a8c252dfca0e90ae83&w=360'),
                  fit: BoxFit.cover),
              //  / color: defaulColor,
              borderRadius: BorderRadiusDirectional.circular(20)),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Travels  Lovers',
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
