import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tec_leal/core/cubit/movies_popular_cubit.dart';
import 'package:prueba_tec_leal/core/enums/posters_sizes.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/screens/detail_screen/widget/movie_detail_item.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_button.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../main_content/widget/movie_popular_item.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late PageController _controller;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
        initialPage: context.read<MoviesPopularCubit>().index,
        viewportFraction: .8);
    _selectedIndex = _controller.initialPage;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Popular'),
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
        ),
        backgroundColor: AppStyle.black,
        body: BlocBuilder<MoviesPopularCubit, MoviesPopularState>(
          builder: (context, state) {
            if (state is MoviesPopularLoaded) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              '${PosterSize.urlImage}/${PosterSize.w400}/${state.listOfMovies.results![_selectedIndex].posterPath}',
                            ),
                            fit: BoxFit.fill)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.white.withOpacity(.14),
                      ),
                    ),
                  ),
                  PageView.builder(
                      itemCount: state.listOfMovies.results?.length,
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      pageSnapping: true,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              context.read<MoviesPopularCubit>().index = index;
                              Navigator.pushNamed(context, 'detail');
                            },
                            child: MovieDetailItem(
                                movie: state.listOfMovies.results![index],
                                isSelected: _selectedIndex == index),
                          )),
                  Positioned(
                    bottom: 30,
                    right: 110.w,
                    child: CustomButton(
                        title: 'Watch now',
                        backgroundColor: AppStyle.mainColor,
                        onPress: () {
                          print(state
                              .listOfMovies.results![_selectedIndex].title);
                          // Navigator.pushNamed(context, 'watch');
                        }),
                  )
                ],
              );
            }
            return const CustomProgressIndicator();
          },
        ),
      );
}
