import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/enums/posters_sizes.dart';
import 'package:prueba_tec_leal/core/models/movie_model.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/screens/booking_movie_screen/widgets/header_imdb.dart';
import 'package:prueba_tec_leal/ui/screens/tab_screen/info_screen.dart';
import 'package:prueba_tec_leal/ui/screens/tab_screen/showtime_screen.dart';
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
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.black,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                MovieImageDisposable(
                    image:
                        '${PosterSize.urlImage}/${PosterSize.w400}/${widget.movie?.posterPath}'),
                HeaderImdb(movie: widget.movie!),
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppStyle.mainColor.withOpacity(.4),
                        borderRadius: BorderRadius.circular(10)),
                    child: TabBar(
                        controller: _tabController,
                        labelColor: AppStyle.black,
                        unselectedLabelColor: AppStyle.gray,
                        indicator: BoxDecoration(
                            color: AppStyle.mainColor,
                            boxShadow: [
                              BoxShadow(
                                  color: AppStyle.mainColor.withOpacity(.4),
                                  blurRadius: 5,
                                  spreadRadius: .5,
                                  offset: const Offset(0, 2))
                            ],
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        tabs: [
                          Tab(
                              child:
                                  Text('Details', style: AppStyle.tabTitle1)),
                          Tab(
                              child:
                                  Text('ShowTimes', style: AppStyle.tabTitle1))
                        ]),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: AnimatedContainer(
              height: widget.movie!.overview!.length <= 399 ? 267.h : 400.h,
              duration: const Duration(milliseconds: 300),
              child: TabBarView(controller: _tabController, children: [
                InfoScreen(movie: widget.movie!),
                ShowTimeScreen()
              ]),
            ),
          )
        ],
      ),
    );
  }
}
