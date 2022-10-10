import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/models/movie_model.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/widgets/icon_with_text.dart';

class HeaderImdb extends StatelessWidget {
  final MovieModel movie;
  const HeaderImdb({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, top: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: AppStyle.mainColor,
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                child: Text(
                  'IMDb',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(movie.voteAverage.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17.sp)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(movie.title!, style: AppStyle.movieTitile2),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    movie.favorite!
                        ? Icons.favorite
                        : Icons.favorite_border_rounded,
                    color: movie.favorite! ? AppStyle.mainColor : AppStyle.gray,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconWithText(icon: Icons.favorite, title: '${movie.popularity}'),
              IconWithText(
                  icon: Icons.thumb_up_alt_rounded,
                  title: '${movie.popularity}'),
              IconWithText(
                  icon: Icons.date_range_outlined,
                  title: movie.releaseDate!.substring(0, 4)),
            ],
          )
        ],
      ),
    );
  }
}
