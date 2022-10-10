import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/models/movie_model.dart';
import 'package:prueba_tec_leal/ui/widgets/subtitle_widget.dart';

class InfoScreen extends ConsumerWidget {
  final MovieModel movie;
  const InfoScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubtitleWidget(title: 'Story'),
          Expanded(
              child: ListView(
            padding: EdgeInsets.only(top: 10.h),
            children: [
              Text(movie.overview!, style: TextStyle(fontSize: 17.sp))
            ],
          ))
        ],
      ),
    );
  }
}
