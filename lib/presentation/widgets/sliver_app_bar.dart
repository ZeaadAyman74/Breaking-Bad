import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';

class MySliverAppBar extends StatelessWidget {
  String nickName;
  int charId;
  String image;

  MySliverAppBar(
      {Key? key,
      required this.nickName,
      required this.charId,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: MyColors.myGrey,
      expandedHeight: 600.h,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          nickName,
          style: const TextStyle(color: Colors.white),
        ),
        background: Hero(
            tag: charId,
            child: CachedNetworkImage(
              imageUrl: image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              fadeInCurve: Curves.elasticIn,
            )),
      ),
    );
  }
}
