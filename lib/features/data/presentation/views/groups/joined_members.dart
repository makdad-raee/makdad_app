import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/views/groups/group_details_view.dart';

class JoinedGroups extends StatelessWidget {
  const JoinedGroups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 325,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const GroupDetailsView(),
                      ));
                    },
                    child: Container(
                      height: 200,
                      width: 140,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black38),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://img.freepik.com/free-photo/power-music-collage-concept_23-2150610201.jpg?w=360&t=st=1711457133~exp=1711457733~hmac=99a3d0c2f9391e28cfb645123b997b21c32daeeb541caedd665e88845c7406d8')),
                          //  color: defaulColor,
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  const SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.piano_outlined, color: Colors.grey),
                            Text('Music'),
                          ],
                        ),
                        Text(
                          'Music From The World ',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                        color: defaulColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                        child: Text(
                      'Join',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: 5),
    );
  }
}
