import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/enums/posters_sizes.dart';
import 'package:prueba_tec_leal/core/models/movie_model.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/screens/main_content/widget/rating_stars.dart';

class MoviePopularItem extends StatelessWidget {
  final MovieModel movie;
  const MoviePopularItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                          '${PosterSize.urlImage}/${PosterSize.w400}/${movie.posterPath}'),
                      fit: BoxFit.fill)),
            ),
          ),
          SizedBox(height: 10.h),
          Flexible(
            child: Container(
              width: 180,
              child: Text(
                '${movie.title}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppStyle.movieTitile1,
              ),
            ),
          ),
          RatingStars(rating: movie.voteAverage!.toDouble())
        ],
      ),
    );
  }
}
