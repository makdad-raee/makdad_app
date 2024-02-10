import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/post_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/diveder.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen(
      {super.key, required this.index, required this.postModel});
  final int index;
  final PostModel postModel;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  void initState() {
    SocialCubit.get(context)
        .getAllComments(postId: SocialCubit.get(context).postId[widget.index]);
    super.initState();
  }

  Widget build(BuildContext context) {
    var commentComtroller=TextEditingController();
    return Scaffold(
      appBar: defaultAppar(context: context, title: 'comments'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Expanded(
          child: BlocConsumer<SocialCubit, SocialState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = SocialCubit.get(context);
              return Form(
                key: formkey,
                child: Column(
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
                    cubit.comments.isNotEmpty
                        ? Expanded(
                            child: ListView.separated(
                            separatorBuilder: (context, index) => Diveder(),
                            //physics: NeverScrollableScrollPhysics(),
                            itemCount: cubit.commentCount[widget.index],
                            itemBuilder: (context, child) => CustomCommentItem(
                              name: cubit.comments[child].name!,
                              commentText: cubit.comments[child].commentText!,
                              dateTime: cubit.comments[child].dateTime!,
                              image: cubit.comments[child].image!,
                            ),
                          ))
                        : const Center(child: Text("no comment")),
                    SizedBox(
                      height: 48,
                      child: TextFormField(
                        controller: commentComtroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'must not be empty ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            //  suffixIcon: const Icon(FontAwesomeIcons.paperPlane),
                            label: const Text('Write Your Comment'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                            )),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            cubit.commentPost(
                                postId: cubit.postId[widget.index],
                                commentText: commentComtroller.text);
                          }
                        },
                        icon: const Icon(FontAwesomeIcons.paperPlane))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomCommentItem extends StatelessWidget {
  const CustomCommentItem({
    super.key,
    required this.name,
    required this.commentText,
    required this.dateTime,
    required this.image,
  });
  final String name;
  final String commentText;
  final String dateTime;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(image),
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
                            name,
                            style: style16,
                          ),
                          Text(
                            commentText,
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
