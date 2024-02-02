import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';

class AvatarNameAndMore extends StatelessWidget {
  const AvatarNameAndMore({
    super.key,
    this.isCreate = false,
  });

  final bool isCreate;
  @override
  Widget build(BuildContext context) {
    return Row(
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
                  isCreate
                      ? const SizedBox()
                      : const Icon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.blue,
                          size: 18,
                        ),
                ],
              ),
              isCreate
                  ? const Text(
                      'Public',
                      style:
                          TextStyle(color: Color.fromARGB(255, 112, 108, 108)),
                    )
                  : Text(
                      'January 30/5/2024 at 11 PM',
                      style: style12!.copyWith(height: 1.4),
                    ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        !isCreate
            ? IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              )
            : const SizedBox(),
      ],
    );
  }
}
