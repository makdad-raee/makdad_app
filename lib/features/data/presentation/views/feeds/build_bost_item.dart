import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/avatar_name_and_more.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/custom_reaction.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/diveder.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/hash_tag.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/photo_of_the_post.dart';

class BuildPostItem extends StatelessWidget {
  const BuildPostItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: AvatarNameAndMore(),
            ),
            const Diveder(),
            Text(
              'What is Lorem Ipsum? is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.',
              style: style14.copyWith(height: 1.3),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  children: [
                    HashTag(),
                  ],
                ),
              ),
            ),
            const PhotoOfThePost(),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: CustomReaction(
                        text: '600',
                        icon: FontAwesomeIcons.heart,
                      )),
                      Spacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: Expanded(
                      child: CustomReaction(
                          icon: FontAwesomeIcons.comment,
                          color: Colors.amber,
                          text: '1200 comments'),
                    ),
                  ),
                ],
              ),
            ),
            const Diveder(),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/woman-sportswear-exercising-outdoors_23-2148965007.jpg?t=st=1706044475~exp=1706045075~hmac=68c156d1ff94c3efd853725b26ef5192db95e11c18c1ae56a1b4ada27f166674'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Write a Comment ... ',
                          style: style12,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.heart,
                        color: Colors.red,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Like',
                        style: style14.copyWith(
                            color: const Color.fromARGB(255, 113, 111, 111)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
