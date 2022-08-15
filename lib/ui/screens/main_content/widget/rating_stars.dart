import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;
  const RatingStars(
      {Key? key,
      required this.rating,
      this.size = 17,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating / 2,
      itemSize: size,
      onRatingUpdate: (value) {},
      allowHalfRating: true,
      itemCount: 5,
      ignoreGestures: true,
      ratingWidget: RatingWidget(
          full: Icon(
            Icons.star,
            color: color,
          ),
          half: Icon(
            Icons.star_half,
            color: color,
          ),
          empty: Icon(
            Icons.star_border_outlined,
            color: color,
          )),
    );
  }
}
