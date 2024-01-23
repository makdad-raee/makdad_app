import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';

class SocialHomeView extends StatelessWidget {
  const SocialHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              
            }, icon:const Icon(FontAwesomeIcons.bell)),
            IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.magnifyingGlass))
          ],
          title: Text(
            cubit.titlels[cubit.currentIndex],
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: cubit.screensNave[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeBottomNav(value);
            },
            items: bottomNavigationBarItems),
      ),
    );
  }
}
