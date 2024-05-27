import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';

class OnlineMemberOfGroups extends StatelessWidget {
  const OnlineMemberOfGroups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundColor: defaulColor,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.grey,
                  ),
                ),
                Text(
                  'Diana Ws',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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