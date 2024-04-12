import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';

class CreateGroupFormFields extends StatelessWidget {
  const CreateGroupFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController typeController = TextEditingController();
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {
        if (state is SocialCreateGroupSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create Group',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              DefaultTextFoemFieldForGroups(
                  textEditingController: nameController,
                  hintText: ' Name of the group'),
              const SizedBox(
                height: 24,
              ),
              DefaultTextFoemFieldForGroups(
                  textEditingController: typeController,
                  suffixIcon: const Icon(Icons.type_specimen_rounded),
                  hintText: ' Type of the Group'),
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: defaulColor, borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                    onPressed: () {
                      SocialCubit.get(context).creategroup(
                          name: nameController.text, type: typeController.text);
                    },
                    child: const Text(
                      'Create Group',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              state is SocialCreateGroupLoadingState
                  ? const CircularProgressIndicator()
                  : const SizedBox(),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                    color: defaulColor, borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                    onPressed: () {
                      SocialCubit.get(context).getAllGroups();
                    },
                    child: const Text(
                      'get Group',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              // state is SocialCreateGroupLoadingState
              //     ? const CircularProgressIndicator()
              //     : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultTextFoemFieldForGroups extends StatelessWidget {
  const DefaultTextFoemFieldForGroups({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.textEditingController,
  });
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon ?? const Icon(Icons.person),
        fillColor: defaulColor,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: defaulColor),
            borderRadius: BorderRadius.circular(16)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
