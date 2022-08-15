import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/cubit/movie_recommendation_cubit.dart';
import 'package:prueba_tec_leal/core/cubit/movies_popular_cubit.dart';
import 'package:prueba_tec_leal/ui/screens/detail_screen/detail_screen.dart';
import 'package:prueba_tec_leal/ui/screens/main_content/widget/movie_popular_item.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:prueba_tec_leal/ui/widgets/dialogs/exception_dialog.dart';

class MoviePopularList extends StatefulWidget {
  const MoviePopularList({Key? key}) : super(key: key);

  @override
  State<MoviePopularList> createState() => _MoviePopularListState();
}

class _MoviePopularListState extends State<MoviePopularList> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: .7);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesPopularCubit, MoviesPopularState>(
      listener: (context, state) {
        if (state is MoviesPopularError) {
          exceptionDialog(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is MoviesPopularLoading) {
          return const CustomProgressIndicator();
        } else if (state is MoviesPopularLoaded) {
          return Container(
            height: 400.h,
            child: PageView.builder(
                itemCount: state.listOfMovies.results?.length,
                controller: _pageController,
                onPageChanged: (index) {
                  context.read<MoviesPopularCubit>().index = index;
                },
                pageSnapping: true,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'details');
                      },
                      child: MoviePopularItem(
                          movie: state.listOfMovies.results![index]),
                    )),
          );
        }
        return Container();
      },
    );
  }
}
