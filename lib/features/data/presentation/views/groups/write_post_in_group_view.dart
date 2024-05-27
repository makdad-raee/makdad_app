import 'package:flutter/material.dart';
import 'package:makdad_app/features/data/presentation/views/groups/write_post_field.dart';

class WritePostInGroupView extends StatelessWidget {
  const WritePostInGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WritePostInGroupField(),));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 12,
          left: 12,
        ),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(224, 224, 224, 1),
                blurRadius: 6,
                offset: Offset(0, 2)),
            BoxShadow(color: Colors.white, blurRadius: 6, offset: Offset(2, 0))
          ],
          border:
              Border.all(width: 2, color: const Color.fromRGBO(224, 224, 224, 1)),
          borderRadius: BorderRadiusDirectional.circular(40),
          color: Colors.grey[200],
        ),
        child: Text(
          'What\'s in your mind ?',
          style: TextStyle(
              fontSize: 20, color: Colors.grey[500], fontStyle: FontStyle.italic),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}