import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/enums/posters_sizes.dart';
import 'package:prueba_tec_leal/core/models/movie_model.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/screens/booking_movie_screen/widgets/header_imdb.dart';
import 'package:prueba_tec_leal/ui/screens/tab_screen/info_screen.dart';
import 'package:prueba_tec_leal/ui/screens/tab_screen/showtime_screen.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_button.dart';
import 'package:prueba_tec_leal/ui/widgets/movie_image_disposable.dart';

class BookingMovieScreen extends ConsumerStatefulWidget {
  final MovieModel? movie;
  const BookingMovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookingMovieScreenState();
}

class _BookingMovieScreenState extends ConsumerState<BookingMovieScreen>
    with SingleTickerProviderStateMixin {
  // TabController? _tabController;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(() {
      print(_scrollController?.position);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.black,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    MovieImageDisposable(
                        image:
                            '${PosterSize.urlImage}/${PosterSize.w400}/${widget.movie?.posterPath}'),
                    HeaderImdb(movie: widget.movie!),
                    SizedBox(height: 18.h),
                    InfoScreen(movie: widget.movie!),
                    SizedBox(height: 100.h)
                  ],
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: CustomButton(
                    backgroundColor: AppStyle.mainColor,
                    title: 'Buy tickets',
                    onPress: () {}),
              ))
        ],
      ),
    );
  }
}
