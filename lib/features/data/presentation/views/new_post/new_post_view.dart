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
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppar(
            context: context,
            title: 'Create Post',
            action: [
              TextButton(
                onPressed: () {},
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
                const AvatarNameAndMore(isCreate: true),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                        hintText: "What is on your mind..."),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){}, child: const Row(
                    children: [
                      Icon(FontAwesomeIcons.image),
                    SizedBox(width: 8,),
                      Text('Add Photo'),
                    ],
                  ),),
                  const Spacer(),
                  TextButton(onPressed: () {
                    
                  }, child: const Text('# Tags',style: TextStyle(fontSize: 16),))
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
