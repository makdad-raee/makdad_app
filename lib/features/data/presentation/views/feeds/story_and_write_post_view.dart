import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/user_model.dart';

class StoryAndWritePostView extends StatelessWidget {
  const StoryAndWritePostView({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
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
          ),
          Container(
            height: 160,
            //color: Colors.green,
            child: Row(
              children: [
                AddStoryFromFeeds(imageUrl: userModel.image!),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const ListViewOfStoryFromFeeds(),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 6,
                          ),
                      itemCount: 6),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddStoryFromFeeds extends StatelessWidget {
  const AddStoryFromFeeds({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 110,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(16)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 65,
                width: 110,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage('')),
                  color: defaulColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewOfStoryFromFeeds extends StatelessWidget {
  const ListViewOfStoryFromFeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 110,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(16)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 65,
                width: 110,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage('')),
                  color: defaulColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
    ;
  }
}

class CustomSCrollViewForStory extends StatelessWidget {
  const CustomSCrollViewForStory({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [
        const SliverToBoxAdapter(
          child: AddStoryFromFeeds(imageUrl: ''),
        ),
        // SliverList.builder(
        //   itemCount: 5,
        //   itemBuilder: (context, index) => ListViewOfStoryFromFeeds(),
        // )
      ],
    );
  }
}
