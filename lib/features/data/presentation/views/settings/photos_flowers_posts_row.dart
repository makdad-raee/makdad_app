import 'package:flutter/material.dart';

class PhotosFlowersPostsCounter extends StatelessWidget {
  const PhotosFlowersPostsCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text(
                    '23',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text('Posts',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text(
                    '1.8 K',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text('followers',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text(
                    '392',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text('following',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: InkWell(
          //     onTap: () {},
          //     child: const Column(
          //       children: [
          //         Text('690 K'),
          //         Text('Follwers'),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
