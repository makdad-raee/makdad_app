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
                      'https://img.freepik.com/free-photo/beautiful-collage-travel-concept_23-2149232169.jpg?w=360&t=st=1711461179~exp=1711461779~hmac=bb87314fa7b87f953d49666d986dc70d7d465c6127c11734a19cc9fa7050bcb9'),
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