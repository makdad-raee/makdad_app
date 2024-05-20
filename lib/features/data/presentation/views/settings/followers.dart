import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';

class Followers extends StatelessWidget {
  const Followers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppar(context: context, title: 'Following'),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder:(context, index) =>  const SizedBox(height: 8),
          itemBuilder: (context, index) => 
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/portrait-beautiful-smiling-blond-model-dressed-summer-hipster-clothes-trendy-girl-posing-street-background-funny-positive-woman_158538-5479.jpg?size=626&ext=jpg&ga=GA1.1.1667027219.1706042622&semt=ais"),
            ),
            const SizedBox(
              width: 15,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Carla Washigton',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(' Designer', style: TextStyle(fontSize: 12)),
              ],
            ),
            const Spacer(),
            Container(
             height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: defaulColor),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: Text('Follow',
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic))),
              ),
            )
          ],
              ),
        ),
      ),
    );
  }
}