import 'package:flutter/material.dart';

class PhotoOfThePost extends StatelessWidget {
  const PhotoOfThePost({
    super.key, required this.photoPost,
  });
  final String? photoPost;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image:  DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
           photoPost!,
          ),
        ),
      ),
    );
  }
}