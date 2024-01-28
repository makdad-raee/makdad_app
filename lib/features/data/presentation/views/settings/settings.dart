import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/constant.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://img.freepik.com/free-photo/medium-shot-woman-eating-delicious-pizza_23-2150280218.jpg?w=740&t=st=1706081529~exp=1706082129~hmac=fe7bd96859ecaf7cf9c0be90d7eb1f3bb7191c96d6a43f69a6ea8b51aba537d0',
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 64,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/happiness-wellbeing-confidence-concept-cheerful-attractive-african-american-woman-curly-haircut-cross-arms-chest-self-assured-powerful-pose-smiling-determined-wear-yellow-sweater_176420-35063.jpg?w=740&t=st=1706452962~exp=1706453562~hmac=1073f10f620d9a462e450414b8c4f166d2474c0422a2010fba27e8cb68bb8a16'),
                  ),
                ),
              ],
            ),
          )
       ,const Text('Sara Ahmed',style: style22,),
       Text('Bio...',style: style12,),
        ],
      ),
    );
  }
}
