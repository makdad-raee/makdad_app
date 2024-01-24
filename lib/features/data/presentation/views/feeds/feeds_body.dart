import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/custom_reaction.dart';
import 'package:makdad_app/features/data/presentation/views/widgets/diveder.dart';

class FeedsBody extends StatelessWidget {
  const FeedsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Card(
          margin: EdgeInsets.all(8),
          elevation: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            Image(
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/man-woman-sportswear-exercising-outdoors_23-2148965023.jpg?w=740&t=st=1706044767~exp=1706045367~hmac=a4aaf226e46e72669ae1e05443252e28dad7c8a4b57532ad5d29a2828c3fc814'),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('comuncate with friends'),
            ),
          ]),
        ),
        Card(
          margin: const EdgeInsets.all(8),
          elevation: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/woman-sportswear-exercising-outdoors_23-2148965007.jpg?t=st=1706044475~exp=1706045075~hmac=68c156d1ff94c3efd853725b26ef5192db95e11c18c1ae56a1b4ada27f166674'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Sara Ahmed',
                                  style: style18!.copyWith(height: 1.4),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: Colors.blue,
                                  size: 18,
                                )
                              ],
                            ),
                            Text(
                              'January 30/5/2024 at 11 PM',
                              style: style12!.copyWith(height: 1.4),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                      ),
                    ],
                  ),
                ),
                const Diveder(),
                Text(
                  'What is Lorem Ipsum? is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.',
                  style: style14!.copyWith(height: 1.3),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            height: 25,
                            child: MaterialButton(
                              minWidth: 1,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: const Text(
                                '#software',
                                style: TextStyle(color: defaulColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: CustomReaction(
                            text: '600',
                            icon: FontAwesomeIcons.heart,
                          )),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Expanded(
                        child: CustomReaction(
                            icon: FontAwesomeIcons.comment,
                            color: Colors.amber,
                            text: '1200'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}



