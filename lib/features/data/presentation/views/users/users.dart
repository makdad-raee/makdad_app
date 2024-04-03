import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/constant.dart';

import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/Friends/friends_view_from_the_top.dart';
import 'package:makdad_app/features/data/presentation/views/groups/groups_view_from_the_top_.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
          appBar: TabBar(
            padding: const EdgeInsets.all(8),
            tabs: const [
              Text(
                'Groups',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                '#Trending',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ],
            controller: _tabController,
            labelColor: defaultColor,
            //dividerColor: defaultColor,
            //unselectedLabelColor: defaultColor,
            indicatorColor: defaultColor,
          ),
          body: TabBarView(
              controller: _tabController,
              children: const [GroupsViewFromTop(), TrendingNow()])),
    );
  }
}

class TrendingNow extends StatelessWidget {
  const TrendingNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
          itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://img.freepik.com/free-photo/full-length-portrait-basketball-player-with-ball_155003-12957.jpg?w=360')),
                    color: Colors.grey,
                    borderRadius: BorderRadiusDirectional.circular(10)),
              )),
    );
  }
}
