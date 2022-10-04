import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/enums/posters_sizes.dart';
import 'package:prueba_tec_leal/core/models/movie_model.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/screens/main_content/widget/rating_stars.dart';

class MovieDetailItem extends StatelessWidget {
  final MovieModel movie;
  final bool isSelected;
  const MovieDetailItem({
    Key? key,
    required this.movie,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isSelected ? 480.h : 450.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                          '${PosterSize.urlImage}/${PosterSize.w400}/${movie.posterPath}'),
                      fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Center(
              child: Text(
                '${movie.title}',
                style: AppStyle.movieTitile2,
              ),
            ),
          ),
          Center(
              child: RatingStars(
            rating: movie.voteAverage!.toDouble(),
            size: 30,
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Center(
              child: Text(
                'IMDb: ${movie.voteAverage}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
