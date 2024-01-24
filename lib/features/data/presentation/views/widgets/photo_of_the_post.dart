import 'package:flutter/material.dart';

class PhotoOfThePost extends StatelessWidget {
  const PhotoOfThePost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://img.freepik.com/free-photo/medium-shot-woman-eating-delicious-pizza_23-2150280218.jpg?w=740&t=st=1706081529~exp=1706082129~hmac=fe7bd96859ecaf7cf9c0be90d7eb1f3bb7191c96d6a43f69a6ea8b51aba537d0',
          ),
        ),
      ),
    );
  }
}