import 'package:flutter/material.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/build_bost_item.dart';

class FeedsBody extends StatelessWidget {
  const FeedsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Card(
          margin: EdgeInsets.all(8),
          elevation: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            Image(
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/man-woman-sportswear-exercising-outdoors_23-2148965023.jpg?w=740&t=st=1706044767~exp=1706045367~hmac=a4aaf226e46e72669ae1e05443252e28dad7c8a4b57532ad5d29a2828c3fc814'),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Comuncate with friends'),
            ),
          ]),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, child) => const BuildPostItem()),
      ],
    );
  }
}
