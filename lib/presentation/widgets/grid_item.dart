import 'package:breaking_bad/core/constants/colors.dart';
import 'package:breaking_bad/core/constants/routes.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class GridItem extends StatelessWidget {
  final CharactersModel character;

 const GridItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Character//////////////////////////${character.charId}');
    }
    return Container(
      width: double.infinity,
      margin:  EdgeInsetsDirectional.fromSTEB(8.w, 8.h, 8.w, 8.h),
      padding: const EdgeInsetsDirectional.all(4),
      decoration:  BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, charactersDetailsScreenRoute,arguments: character);
        },
        child: GridTile(
            footer: Container(
              color: Colors.black54,
              padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              alignment: Alignment.center,
              child: Text(
                "${character.name}",
                style:  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    height: 1.3.h),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            child: Hero(
              tag: character.charId!,/**/
                child:CachedNetworkImage(
                  imageUrl: character.img!,
                  fit: BoxFit.cover,
                  fadeInCurve: Curves.easeInSine,
                  placeholder: (context,url)=>Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                    ),
                  ),
                  errorWidget: (context,url,error)=>const Icon(Icons.error),

                ),
                // child:FadeInImage.assetNetwork(
                //         fadeInCurve: Curves.easeInSine,
                //         fit: BoxFit.cover,
                //         placeholder: 'assets/images/loading.gif',
                //         image: character.img!,
                //
                // ), // any thing,

            )),
      ),
    );
  }
}
