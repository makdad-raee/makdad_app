import 'package:flutter/material.dart';

class SuggestedGroupForYou extends StatelessWidget {
  const SuggestedGroupForYou({
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
                  border: Border.all(width: 1, color: Colors.black38),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/fit-blond-woman-with-perfect-smile-stylish-sportswear-looking-camera-holding-bottle-water-white-wall-demonstrate-muscles_273443-4534.jpg?size=626&ext=jpg&ga=GA1.1.1667027219.1706042622&semt=sph'),
                      fit: BoxFit.cover),
                  // color: defaulColor,
                  borderRadius: BorderRadiusDirectional.circular(20)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4),
              child: Text(
                'Health',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: Text(
                'Healthy LifeStyle',
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
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