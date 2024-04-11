import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/build_bost_item.dart';
import 'package:makdad_app/features/data/presentation/views/settings/edit_profile.dart';
import 'package:makdad_app/features/data/presentation/views/settings/photos_flowers_posts_row.dart';
import 'package:makdad_app/features/data/presentation/views/settings/profile_pic_bio_name.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
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
      builder: (context, state) {
        var listPosts = SocialCubit.get(context).mypost;
        var userModel = SocialCubit.get(context).usermodel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfilePicAndNameAndBio(
                  name: userModel.name ?? "",
                  coverImage: userModel.coverImage,
                  bio: userModel.bio,
                  profileImage: userModel.image,
                ),
                const SizedBox(
                  height: 12,
                ),
                // const AddFriendANdMessages(),
                const PhotosFlowersPostsCounter(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ))),
                        child: const Text(
                          'Add Photos',
                          style: TextStyle(color: defaulColor),
                        ),
                        onPressed: () {
                          // SocialCubit.get(context).sendMessageNoti(title: 'tryyy', messagge: 'tryyy2');
                          SocialCubit.get(context).logOut();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ))),
                      child: const Icon(
                        FontAwesomeIcons.penToSquare,
                        color: defaulColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditProfileView(),
                        ));
                      },
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: TabBar(
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
                            Text('Feeds'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.video_camera_front),
                            SizedBox(
                              width: 4,
                            ),
                            Text('Video'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.tag),
                            SizedBox(
                              width: 4,
                            ),
                            Text('Tags'),
                          ],
                        ),
                      ]),
                ),
                Container(
                  height: double.maxFinite,
                  width: double.infinity,
                  child: TabBarView(controller: _tabController, children: [
                    Column(
                      children: [
                        // const StoryAndWritePostView(),
                        listPosts.isEmpty
                            ? Center(child: defaultIndicator())
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: listPosts.length,
                                itemBuilder: (context, child) => BuildPostItem(
                                      postModel: listPosts[child],
                                      userModel: userModel,
                                      index: child,
                                    )),
                      ],
                    ),
                    Text('kkkkk'),
                    Text('kkkkk'),
                  ]),
                ),

                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
