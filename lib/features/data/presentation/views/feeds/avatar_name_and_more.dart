import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';

class AvatarNameAndMore extends StatelessWidget {
  const AvatarNameAndMore({
    super.key,
    this.isCreate = false,
     this.name,
     this.profileImage,  this.dateTime,
 
  });
  final String? name;
  final String? profileImage;
  final String? dateTime;

  final bool isCreate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(profileImage??''),
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
                    name??'',
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
                      dateTime??'',
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
