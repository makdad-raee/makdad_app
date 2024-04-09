import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/views/search/search_form_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          leading: const SizedBox(),
          leadingWidth: 0,
          actions: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: CircleAvatar(
                      backgroundColor: defaulColor,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Expanded(
                    child: SearchFormField(),
                  ),
                ],
              ),
            )
          ],
          bottom: const TabBar(
              //  isScrollable: true,
              //  dragStartBehavior: DragStartBehavior.down,
              labelColor: defaulColor,
              indicatorColor: defaulColor,
              tabs: [
                Text(
                  "Account",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
                Text(
                  "Groups",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
                Text(
                  "Pages",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
                Text(
                  "#News",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                )
              ]),
        ),
        body: const TabBarView(children: [
          AccountSearchSort(),
          GroupsSearchSorting(),
          PagesSearchSorting(),
          NewsSesarchSort(),
        ]),
      ),
    );
  }
}

class AccountSearchSort extends StatelessWidget {
  const AccountSearchSort({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [RowAvatarandFollow()],
      ),
    );
  }
}

class RowAvatarandFollow extends StatelessWidget {
  const RowAvatarandFollow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          //  height: 60,
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
    );
  }
}

class NewsSesarchSort extends StatelessWidget {
  const NewsSesarchSort({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: defaulColor.withOpacity(0.7),
              radius: 30,
              child: const Icon(FontAwesomeIcons.hashtag),
            ),
            const SizedBox(
              width: 15,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fashion ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  '12 M Posts',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Colors.black54),
                ),
              ],
            ),
            const Spacer(),
            // Container(
            //   //  height: 60,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12), color: defaulColor),
            //   child: const Padding(
            //     padding: EdgeInsets.all(10.0),
            //     child: Center(child: Text('Join Group')),
            //   ),
            // )
          ],
        ),
      ],
    );
  }
}

class GroupsSearchSorting extends StatelessWidget {
  const GroupsSearchSorting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/top-view-illustrator-drawing-ipad_23-2150040082.jpg?w=740"),
              ),
              const SizedBox(
                width: 15,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Designers Group',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    '18 k Members',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        color: Colors.black54),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                //  height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: defaulColor),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                      child: Text('Join Group',
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic))),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PagesSearchSorting extends StatelessWidget {
  const PagesSearchSorting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/delicious-burger-with-many-ingredients-isolated-white-background-tasty-cheeseburger-splash-sauce_90220-1266.jpg?w=740"),
              ),
              const SizedBox(
                width: 15,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Food Community',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    '18 k Likes',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        color: Colors.black54),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                //  height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: defaulColor),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Center(
                      child: Text(
                    'Like',
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
