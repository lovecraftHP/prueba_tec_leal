import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/enums/posters_sizes.dart';
import 'package:prueba_tec_leal/core/models/movie_model.dart';
import 'package:prueba_tec_leal/core/providers/movie_provider.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/widgets/movie_image_disposable.dart';

class BookingMovieScreen extends ConsumerWidget {
  final MovieModel? movie;
  const BookingMovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppStyle.black,
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            MovieImageDisposable(
                image:
                    '${PosterSize.urlImage}/${PosterSize.w400}/${movie?.posterPath}'),
          ]))
        ],
      ),
    );
  }
}
