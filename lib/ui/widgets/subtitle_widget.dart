import 'package:flutter/material.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';

class SubtitleWidget extends StatelessWidget {
  final String title;
  const SubtitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Text(title, style: AppStyle.movieTitile2);
}
