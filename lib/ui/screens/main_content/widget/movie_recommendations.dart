import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tec_leal/core/cubit/movie_recommendation_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/enums/posters_sizes.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/screens/main_content/widget/rating_stars.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_button.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:prueba_tec_leal/ui/widgets/dialogs/exception_dialog.dart';

class MovieRecommendations extends StatefulWidget {
  const MovieRecommendations({Key? key}) : super(key: key);

  @override
  State<MovieRecommendations> createState() => _MovieRecommendationsState();
}

class _MovieRecommendationsState extends State<MovieRecommendations> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieRecommendationtCubit, MovieRecommendationState>(
      listener: (context, state) {
        if (state is MovieRecommendationError) {
          exceptionDialog(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is MovieRecommendationLoading) {
          return const CustomProgressIndicator();
        } else if (state is MovieRecommendationLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.listOfRecommendations.results!
                .map((movie) => Container(
                      height: 280.h,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Container(
                                height: 250.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${PosterSize.urlImage}/${PosterSize.w400}/${movie.posterPath}'),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(right: 3.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '${movie.title}',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
                                    child: Text(
                                      'IMDb: ${movie.voteAverage}',
                                    ),
                                  ),
                                  RatingStars(
                                    rating: movie.voteAverage!.toDouble(),
                                    size: 18.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomButton(
                                        title: 'Watch now',
                                        fontSize: 14.sp,
                                        onPress: () {
                                          Navigator.pushNamed(context, 'watch');
                                        },
                                        backgroundColor: AppStyle.mainColor,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              movie.favorite = !movie.favorite!;
                                            });
                                          },
                                          icon: Icon(
                                              movie.favorite!
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border_outlined,
                                              color: movie.favorite!
                                                  ? AppStyle.mainColor
                                                  : Colors.white))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
          );
        }
        return Container();
      },
    );
  }
}
