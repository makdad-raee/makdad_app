import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/views/groups/group_browsing.dart';
import 'package:makdad_app/features/data/presentation/views/groups/joined_members.dart';

class MainGroupsView extends StatelessWidget {
  const MainGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppar(context: context, title: 'Groups'),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              JoinedGroups(),
              GroupBrowsing(),
            ],
          ),
        ),
      ),
    );
  }
}
