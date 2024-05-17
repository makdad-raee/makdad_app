import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/groups/create_group_form_field.dart';

import 'package:makdad_app/features/data/presentation/views/groups/main_groups_view.dart';
import 'package:makdad_app/features/data/presentation/views/groups/most_active_groups.dart';
import 'package:makdad_app/features/data/presentation/views/groups/suggested_groups_to_you.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = SocialCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Have a Good Day,\n Hasan 👋 ',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(24),
                                border: Border.all(width: 1),
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    'Send a Public message ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  Spacer(),
                                  Icon(Icons.sticky_note_2,
                                      color: Colors.black54),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Icon(Icons.star_border_rounded,
                                      color: Colors.black54),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const CircleAvatar(
                              radius: 24,
                              backgroundColor: defaulColor,
                              child: Icon(
                                Icons.send_sharp,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
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
                        child:
                            TabBarView(controller: _tabController, children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Popular ',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const MainGroupsView(),
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
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
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
                                    itemCount: cubit.allGroups.length,
                                    itemBuilder: (context, index) =>
                                        MostActiveGroupsItem(
                                            groupModel: cubit.allGroups[index]),
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
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500),
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
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const SuggestedGroupForYou()
                            ],
                          ),
                          const CreateGroupView()
                          //   Text('kkkkk'),
                        ]),
                      ),
                    ]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CreateGroupView extends StatelessWidget {
  const CreateGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CreateGroupFormFields(),
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: defaulColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        'Cretae Group',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Your Groups',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black26),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Group Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          'Members',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          'Last Active',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          'Action',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 100,
                      child: ListView.separated(
                        itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(cubit.myGroups[index].name),
                            const Spacer(),
                            const Text('23 K'),
                            const Spacer(),
                            const Text('2 days ago'),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                    color: defaulColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        itemCount: cubit.myGroups.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 6,
                        ),
                      ),
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 4, vertical: 12),
                    //     decoration: BoxDecoration(
                    //       border: Border.all(width: 1, color: Colors.black26),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     child: Expanded(
                    //       child:
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your Group Activity',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black26),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 5.0,
                          percent: 0.6,
                          center: const Text("60%"),
                          progressColor: Colors.green,
                        ),
                      ),
                      const Text(
                        'Realtime Activity',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black26),
                      // color: Colors.grey,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: CircularPercentIndicator(
                          radius: 60.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 6.0,
                          percent: 0.7,
                          center: const Text(
                            "70 %",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.grey,
                          progressColor:
                              const Color(0xFFFF9800).withOpacity(0.8),
                        ),
                      ),
                      const Text(
                        'Reaction Activity',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black26),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: CircularPercentIndicator(
                          radius: 60.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 6.0,
                          percent: 0.5,
                          center: const Text(
                            "50 %",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.grey,
                          progressColor:
                              const Color(0xff64C9CF).withOpacity(0.9),
                        ),
                      ),
                      const Text(
                        'New Views',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: CircularPercentIndicator(
                          radius: 60.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 6.0,
                          percent: 0.8,
                          center: const Text(
                            "60 %",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              //  color: Colors.black
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.grey,
                          progressColor: const Color(0xfffB2A4FF),
                        ),
                      ),
                      const Text(
                        'Members Activity',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
