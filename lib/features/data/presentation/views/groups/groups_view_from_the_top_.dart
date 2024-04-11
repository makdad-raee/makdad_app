import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/views/groups/create_group_form_field.dart';

import 'package:makdad_app/features/data/presentation/views/groups/main_groups_view.dart';
import 'package:makdad_app/features/data/presentation/views/groups/most_active_groups.dart';
import 'package:makdad_app/features/data/presentation/views/groups/suggested_groups_to_you.dart';

class GroupsViewFromTop extends StatefulWidget {
  const GroupsViewFromTop({
    super.key,
  });

  @override
  State<GroupsViewFromTop> createState() => _GroupsViewFromTopState();
}

class _GroupsViewFromTopState extends State<GroupsViewFromTop>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              Container(
                height: 50,
                width: double.infinity,
                child: TabBar(
                    // padding: EdgeInsets.zero,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: defaulColor,
                    controller: _tabController,
                    tabs: const [
                      Row(
                        children: [
                          Icon(Icons.feed),
                          SizedBox(
                            width: 4,
                          ),
                          Text('Explored'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.video_camera_front),
                          SizedBox(
                            width: 4,
                          ),
                          Text('Groups'),
                        ],
                      ),
                    ]),
              ),
              Container(
                height: 650,
                width: double.infinity,
                child: TabBarView(controller: _tabController, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Popular ',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MainGroupsView(),
                                ));
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                size: 28,
                              ))
                        ],
                      ),
                      Text(
                        'The most active groups in the community',
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 220,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 8,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) =>
                                const MostActiveGroupsItem(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Suggested For You ',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 28,
                                  )),
                            ],
                          ),
                          Text(
                            'Based on another groups you\'re part of',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const SuggestedGroupForYou()
                    ],
                  ),
                  CreateGroupView()
                  //   Text('kkkkk'),
                ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CreateGroupView extends StatelessWidget {
  const CreateGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: Text('create group'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateGroupFormFields(),
            ));
          },
        ),
      ],
    );
  }
}
