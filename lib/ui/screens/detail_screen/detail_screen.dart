import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tec_leal/core/enums/posters_sizes.dart';
import 'package:prueba_tec_leal/core/providers/movie_provider.dart';
import 'package:prueba_tec_leal/routes_exports.dart';
import 'package:prueba_tec_leal/ui/screens/detail_screen/widget/movie_detail_item.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:prueba_tec_leal/ui/widgets/dialogs/exception_dialog.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final int index;
  const DetailScreen({Key? key, required this.index}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  late PageController _controller;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _controller =
        PageController(initialPage: widget.index, viewportFraction: .8);
    _selectedIndex = _controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    final popularMovies = ref.watch(movieData);

    return popularMovies.when(
        data: (data) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text('Popular'),
                elevation: 0,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context)),
              ),
              body: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              '${PosterSize.urlImage}/${PosterSize.w400}/${data.results![_selectedIndex].posterPath}',
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
                      itemCount: data.results?.length,
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      pageSnapping: true,
                      itemBuilder: (context, index) => OpenContainer(
                          closedColor: Colors.transparent,
                          closedElevation: 0,
                          closedBuilder: (context, action) => MovieDetailItem(
                              movie: data.results![index],
                              isSelected: _selectedIndex == index),
                          openBuilder: (context, action) =>
                              BookingMovieScreen(movie: data.results?[index]))),
                ],
              ),
            ),
        error: (error, s) =>
            exceptionDialog(context, error.toString()) as Widget,
        loading: () => const CustomProgressIndicator());
  }
}
