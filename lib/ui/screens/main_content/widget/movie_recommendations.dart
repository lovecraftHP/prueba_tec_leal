import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tec_leal/core/cubit/movie_recommendation_cubit.dart';
import 'package:prueba_tec_leal/core/cubit/movies_popular_cubit.dart';

class MovieRecommendations extends StatefulWidget {
  const MovieRecommendations({Key? key}) : super(key: key);

  @override
  State<MovieRecommendations> createState() => _MovieRecommendationsState();
}

class _MovieRecommendationsState extends State<MovieRecommendations> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieRecommendationtCubit, MovieRecommendationState>(
      listener: (context, state) {},
      child: Container(
        child:
            Text(context.read<MovieRecommendationtCubit>().idMovie.toString()),
      ),
    );
  }
}
