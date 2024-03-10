import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/avatar_name_and_more.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({super.key});

  @override
  Widget build(BuildContext context) {
    var textPostController = TextEditingController();
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=SocialCubit.get(context);
        return Scaffold(
          appBar: defaultAppar(
            context: context,
            title: 'Create Post',
            action: [
              TextButton(
                onPressed: () {
                  var now = DateTime.now();
                  if (SocialCubit.get(context).postImage == null) {
                    SocialCubit.get(context).createNewPost(
                        dateTime: now.toString(),
                        postText: textPostController.text);
                  } else {
                    SocialCubit.get(context).uploadImagePost(
                      dateTime: now.toString(),
                      postText: textPostController.text,
                    );
                  }
                },
                child: Text(
                  'Post',
                  style: style16.copyWith(color: defaulColor),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SocialCreatePostLoadingState) defaultIndicator(),
                if (state is SocialCreatePostLoadingState)
                  const SizedBox(
                    height: 12,
                  ),
                 AvatarNameAndMore(isCreate: true ,name:cubit.usermodel.name! ,profileImage:cubit.usermodel.image!,userModel: cubit.usermodel, ),
                Expanded(
                  child: TextFormField(
                    controller: textPostController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "What is on your mind..."),
                  ),
                ),
                if (SocialCubit.get(context).postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image:
                                FileImage(SocialCubit.get(context).postImage!,),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.6),
                        radius: 20,
                        child: IconButton(
                          onPressed: () {
                            SocialCubit.get(context).removePostImage();
                          },
                          icon: const Icon(
                            Icons.close_sharp,
                            size: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        SocialCubit.get(context).pickPostImage();
                      },
                      child: const Row(
                        children: [
                          Icon(FontAwesomeIcons.image),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Add Photo'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          '# Tags',
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
