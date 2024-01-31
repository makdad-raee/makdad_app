import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';

class ProfilePicAndNameAndBio extends StatelessWidget {
  const ProfilePicAndNameAndBio({
    super.key,
    this.profileImage,
    this.coverImage,
    required this.name,
    this.bio,
    this.isEditView = false,
    this.backgroundImageProfile,
    this.onPressedProfile,
    this.onPressedCover,
    this.backgroundImageCover,
  });
  final String? profileImage;
  final String? coverImage;
  final String name;
  final String? bio;
  final bool isEditView;
  final ImageProvider<Object>? backgroundImageProfile;
  final ImageProvider<Object>? backgroundImageCover;
  final void Function()? onPressedProfile;
  final void Function()? onPressedCover;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: backgroundImageCover ??
                              NetworkImage(
                                coverImage ??
                                    'https://img.freepik.com/free-photo/medium-shot-woman-eating-delicious-pizza_23-2150280218.jpg?w=740&t=st=1706081529~exp=1706082129~hmac=fe7bd96859ecaf7cf9c0be90d7eb1f3bb7191c96d6a43f69a6ea8b51aba537d0',
                              ),
                        ),
                      ),
                    ),
                    isEditView
                        ? CircleAvatar(
                            //backgroundColor: Theme.scaffoldBackgroundColor,
                            radius: 20,
                            child: IconButton(
                              onPressed: onPressedCover,
                              icon: const Icon(
                                FontAwesomeIcons.camera,
                                size: 20,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: CircleAvatar(
                      radius: 62,
                      backgroundImage: backgroundImageProfile ??
                          NetworkImage(profileImage ??
                              'https://img.freepik.com/free-photo/happiness-wellbeing-confidence-concept-cheerful-attractive-african-american-woman-curly-haircut-cross-arms-chest-self-assured-powerful-pose-smiling-determined-wear-yellow-sweater_176420-35063.jpg?w=740&t=st=1706452962~exp=1706453562~hmac=1073f10f620d9a462e450414b8c4f166d2474c0422a2010fba27e8cb68bb8a16'),
                    ),
                  ),
                  isEditView
                      ? CircleAvatar(
                          //backgroundColor: Theme.scaffoldBackgroundColor,
                          radius: 20,
                          child: IconButton(
                            onPressed: onPressedProfile,
                            icon: const Icon(
                              FontAwesomeIcons.camera,
                              size: 20,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        isEditView
            ? const SizedBox()
            : Text(
                name,
                style: style22,
              ),
        isEditView
            ? const SizedBox()
            : Text(
                bio ?? 'Bio...',
                style: style12,
              ),
      ],
    );
  }
}
