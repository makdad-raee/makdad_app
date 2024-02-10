import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/user_model.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(userModel.image!),
            ),
            const SizedBox(width: 12),
            Text(userModel.name!),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(chatRadiusCirculer),
                        topLeft: Radius.circular(chatRadiusCirculer),
                        topRight: Radius.circular(chatRadiusCirculer),
                      )),
                  child: const Text('Hello world')),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 139, 208, 158),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(chatRadiusCirculer),
                        topLeft: Radius.circular(chatRadiusCirculer),
                        topRight: Radius.circular(chatRadiusCirculer),
                      )),
                  child: const Text('Hello world')),
            ),
            const Spacer(),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!, width: 1),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'type your message...'),
                      ),
                    ),
                  ),
                  Container(
                    color: defaultColor.withOpacity(0.8),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'send',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
