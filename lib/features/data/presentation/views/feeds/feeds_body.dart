import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/build_bost_item.dart';

class FeedsBody extends StatelessWidget {
  const FeedsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ;
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var listPosts = SocialCubit.get(context).posts;
        var userModel = SocialCubit.get(context).usermodel;

        return Column(
          children: [
            const StoryAndWritePostView(),
            listPosts.isEmpty
                ? Center(child: defaultIndicator())
                : ListView.builder(

                    //  controller: ScrollController(),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listPosts.length,
                    itemBuilder: (context, child) => BuildPostItem(
                          postModel: listPosts[child],
                          userModel: userModel,
                          index: child,
                        )),
          ],
        );
      },
    );
  }
}

class StoryAndWritePostView extends StatelessWidget {
  const StoryAndWritePostView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const NewPostView(),
              // ));
            },
            child: Container(
              padding: const EdgeInsets.only(
                top: 12,
                left: 12,
              ),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(224, 224, 224, 1),
                      blurRadius: 6,
                      offset: Offset(0, 2)),
                  BoxShadow(
                      color: Colors.white, blurRadius: 6, offset: Offset(2, 0))
                ],
                border: Border.all(
                    width: 2, color: const Color.fromRGBO(224, 224, 224, 1)),
                borderRadius: BorderRadiusDirectional.circular(40),
                color: Colors.grey[200],
              ),
              child: Text(
                'What\'s in your mind ?',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          // const SizedBox(
          //   height: 12,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(32)),
                      child: const Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.video,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'live',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ))),
                ),
                const SizedBox(
                  width: 12,
                ),
                //Spacer(),
                Expanded(
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: defaultColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(32)),
                      child: const Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.photoFilm,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Photo',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ))),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300]),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_horiz))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
