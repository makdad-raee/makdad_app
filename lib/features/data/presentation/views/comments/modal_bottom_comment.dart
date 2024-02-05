import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';

class CommentsSheet extends StatelessWidget {
  const CommentsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        children: [
          const CustomCommentItem(),
          SizedBox(
            height: 48,
            child: TextFormField(
              decoration: InputDecoration(
                  suffixIcon: const Icon(FontAwesomeIcons.paperPlane),
                  label: const Text('Write Your Comment'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCommentItem extends StatelessWidget {
  const CustomCommentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(''),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 210, 210),
                        borderRadius: BorderRadius.circular(18)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sara Ahmad",
                            style: style16,
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the  Lorem Ipsum is simply dummy text of the  Lorem Ipsum is simply dummy text of the   ',
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Now'),
                        SizedBox(
                          width: 18,
                        ),
                        Text('Like'),
                        SizedBox(
                          width: 18,
                        ),
                        Text('Reply')
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
