import 'package:flutter/material.dart';
import 'package:makdad_app/features/data/models/group_model.dart';

class MostActiveGroupsItem extends StatelessWidget {
  const MostActiveGroupsItem({
    super.key,
    required this.groupModel,
  });

  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          // height: 100,
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black38),
              image: DecorationImage(
                  image: NetworkImage(groupModel.image!), fit: BoxFit.cover),
              //  / color: defaulColor,
              borderRadius: BorderRadiusDirectional.circular(20)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              groupModel.name!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              '31K Memebers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ],
    );
  }
}
