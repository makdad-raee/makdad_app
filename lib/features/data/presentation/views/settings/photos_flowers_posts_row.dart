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
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Column(
                children: [
                  Text('100'),
                  Text('Post'),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Column(
                children: [
                  Text('150'),
                  Text('Photos'),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Column(
                children: [
                  Text('826'),
                  Text('Following'),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Column(
                children: [
                  Text('690 K'),
                  Text('Follwers'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
