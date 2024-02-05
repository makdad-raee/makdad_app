import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';

class CommentsSheet extends StatelessWidget {
  const CommentsSheet({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Expanded(
        child: BlocConsumer<SocialCubit, SocialState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit=SocialCubit.get(context);
            return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.heart),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'sara Ahmad and 300 others',
                      style: style16,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(FontAwesomeIcons.caretRight),
                    Spacer(),
                    Icon(FontAwesomeIcons.heart),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                //physics: NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: (context, index) => const CustomCommentItem(),
              )),
              SizedBox(
                height: 48,
                child: Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        //  suffixIcon: const Icon(FontAwesomeIcons.paperPlane),
                        label: const Text('Write Your Comment'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        )),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                   cubit.commentPost(cubit.postId[index], 'default comment');
                  },
                  icon: const Icon(FontAwesomeIcons.paperPlane))
            ],
          );
          },
        ),
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
