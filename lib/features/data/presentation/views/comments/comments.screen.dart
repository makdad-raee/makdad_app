import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/post_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/diveder.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppar(context: context, title: 'Comments'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      //color: const Color.fromARGB(255, 141, 206, 143),
                     
                      child:CustomCommentItem() ,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                  itemCount:30),
            ),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!, width: 1),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        //  controller: messageController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'type your comment...'),
                      ),
                    ),
                  ),
                  Container(
                    color: defaultColor.withOpacity(0.8),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'send',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CustomCommentItem extends StatelessWidget {
  const CustomCommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage('image'),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'name',
                            style: style16,
                          ),
                          Text(
                            'commentText',
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