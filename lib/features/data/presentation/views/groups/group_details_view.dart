import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';

class GroupDetailsView extends StatefulWidget {
  const GroupDetailsView({super.key});

  @override
  State<GroupDetailsView> createState() => _GroupDetailsViewState();
}

class _GroupDetailsViewState extends State<GroupDetailsView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GroupDetailsWithCoverAndProfile(),
              const SizedBox(
                height: 8,
              ),
              const GroupsContainersKey(),
              const SizedBox(
                height: 12,
              ),
              MembersTypesTabBar(tabController: _tabController),
              Container(
                height: 120,
                width: double.infinity,
                child: TabBarView(controller: _tabController, children: const [
                  OnlineMemberOfGroups(),
                  NewestMemberOfGroups(),
                ]),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Posts',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                //  height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/beautiful-young-lady-holding-her-blonde-hair-making-pony-tail-before-brakfast-cafe_132075-9376.jpg?t=st=1713262552~exp=1713266152~hmac=4d902507ecf846cc5d606c5e0261cd99c0bf90703f5ea7e707845a13eb1aaf77&w=360'),
                          radius: 32,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Carla Vest',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      '" Follow "',
                                      style: TextStyle(
                                          color: defaulColor,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic),
                                    ))
                              ],
                            ),
                            const Text(
                              'Now',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {},
                          child: Container(
                            //color: defaulColor,
                            padding: const EdgeInsets.all(8),
                            child: const Icon(Icons.more_horiz_outlined),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 1,
                        color: defaulColor,
                      ),
                    ),
                    const Text(
                      'Hello From paris i have been in france from 3 weeks i\'m so happy to be here .',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8)),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/paris-rooftop-view-skyline-eiffel-tower-france_649448-2544.jpg?t=st=1713261618~exp=1713265218~hmac=0ac820e9eee2f9ba449d28a1cbce737c9c793e23897e83a2cfc758081d3bbba7&w=740',
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_outlined,
                              color: Colors.red,
                            ),
                            Text(
                              ' 2.8k Likes',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.messenger,
                              color: Colors.black38,
                            ),
                            Text(
                              ' 2.8k comments',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: defaulColor.withOpacity(0.3),
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.red.withOpacity(0.6),
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: defaulColor.withOpacity(0.3),
                              ),
                              child: const Icon(
                                Icons.messenger,
                                color: Colors.grey,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: defaulColor.withOpacity(0.3),
                              ),
                              child: const Icon(
                                FontAwesomeIcons.share,
                                color: Colors.grey,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MembersTypesTabBar extends StatelessWidget {
  const MembersTypesTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
            top: BorderSide(
              color: Colors.grey,
            ),
            left: BorderSide(
              color: Colors.grey,
            ),
            right: BorderSide(
              color: Colors.grey,
            )),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.group,
            size: 24,
            color: defaulColor,
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            'Members',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic),
          ),
          Expanded(
            child: Container(
              height: 24,
              // color: Colors.red,
              width: double.infinity,
              child: TabBar(
                  padding: EdgeInsets.zero,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: defaulColor,
                  dividerColor: Colors.white,
                  indicatorPadding: const EdgeInsets.all(-10),
                  controller: _tabController,
                  //ooooooooooooooooooooooooo liomon
                  tabs: const [
                    Text('Active'),
                    Text('Newest'),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class GroupsContainersKey extends StatelessWidget {
  const GroupsContainersKey({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 75,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: defaulColor.withOpacity(0.3)),
            child: const Row(
              children: [
                Icon(
                  Icons.group,
                  size: 26,
                  color: defaulColor,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '23',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: defaulColor),
                    ),
                    Text('Posts', style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: 75,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.pink.withOpacity(0.4)),
            child: const Row(
              children: [
                Icon(
                  Icons.person,
                  size: 26,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '45',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                    Text('Join Request',
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: 75,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.purple.withOpacity(0.4)),
            child: const Row(
              children: [
                Icon(
                  Icons.person,
                  size: 26,
                  color: Colors.purple,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '45',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.purple),
                    ),
                    Text('Join Request',
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

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

class NewestMemberOfGroups extends StatelessWidget {
  const NewestMemberOfGroups({
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
                  radius: 32,
                  backgroundColor: Colors.grey,
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
