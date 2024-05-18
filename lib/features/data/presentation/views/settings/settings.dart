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
                SizedBox(
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
                    const MyVideosOnProfile(),
                    const Text('kkkkk'),
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

class MyVideosOnProfile extends StatelessWidget {
  const MyVideosOnProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                          'https://img.freepik.com/free-photo/couple-making-heart-from-hands-sea-shore_23-2148019887.jpg?t=st=1716041400~exp=1716045000~hmac=3d40ae45b75c6fe8ea55f3b9494d513f9ff9475402bb4cb6bc3bf70cf7b1e7ce&w=360',
                        ),
                        fit: BoxFit.cover),
                    //  / color: Colors.grey,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    const Icon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                    ),
                    //  Spacer(),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Adele Official',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(Icons.verified,
                                      color: Colors.white),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  'Hello from the other side ,My new songs is available here ,enjoy 🥰',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(16),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.music_note,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Hello - Adele',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage('https://img.freepik.com/free-vector/hand-drawn-pop-singer-silhouette_23-2150966830.jpg?t=st=1716045743~exp=1716049343~hmac=d46505cd81359e922643bca972c7a0fb0287cf8d0a17564be2405fbb768ba1c6&w=740'),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white.withOpacity(0.7),
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: Icon(
                        FontAwesomeIcons.comment,
                        color: Colors.white.withOpacity(0.8),
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: Icon(
                        FontAwesomeIcons.share,
                        color: Colors.white.withOpacity(0.8),
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
