import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';

class GroupDetailsWithCoverAndProfile extends StatelessWidget {
  const GroupDetailsWithCoverAndProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
          color: Colors.grey),
      height: 150,
      width: double.infinity,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: defaulColor,
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '36% Completed',
                style: TextStyle(fontSize: 18),
              ),
              const Text('Fitness'),
              const Text("welcome to my group"),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      defaulColor.withOpacity(0.4),
                      defaulColor.withOpacity(0.6),
                      defaulColor.withOpacity(0.1)
                    ]),
                    border: Border.all(width: 1.5, color: defaulColor),
                    //  color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: const Row(
                  children: [
                    Text('Complete Profile'),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}