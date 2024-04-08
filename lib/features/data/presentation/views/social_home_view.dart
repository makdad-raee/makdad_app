import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/new_post/new_post_view.dart';
import 'package:makdad_app/features/data/presentation/views/search/search.dart';

class SocialHomeView extends StatelessWidget {
  const SocialHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {
        if (state is SocialNewPostBottomNavState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const NewPostView(),
          ));
        }
      },
      builder: (context, state) => Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          actions: [
            // IconButton(
            //     onPressed: () {},
            //     icon: const Icon(FontAwesomeIcons.magnifyingGlass)),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: CircleAvatar(
            //     backgroundImage: AssetImage(cubit.usermodel.image ?? ''),
            //   ),
            // ),
            IconButton(
                onPressed: () {
            
                },
                icon: const Icon(FontAwesomeIcons.bell)),
            IconButton(
                onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
                },
                icon: const Icon(FontAwesomeIcons.magnifyingGlass))
          ],
          title: Text(
            cubit.titlels[cubit.currentIndex],
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: cubit.screensNave[cubit.currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Container(
            //  height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            // color: Colors.grey,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BottomNavigationBar(
                  unselectedItemColor: Colors.white,
                  backgroundColor: Colors.grey[400],
                  currentIndex: cubit.currentIndex,
                  onTap: (value) {
                    cubit.changeBottomNav(value);
                  },
                  items: bottomNavigationBarItems),
            ),
          ),
        ),
      ),
    );
  }
}
