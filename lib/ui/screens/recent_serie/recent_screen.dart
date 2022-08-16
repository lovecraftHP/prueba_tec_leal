import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prueba_tec_leal/core/cubit/recent_series_cubit.dart';
import 'package:prueba_tec_leal/core/enums/posters_sizes.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:prueba_tec_leal/ui/widgets/dialogs/exception_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/recent_serie_item.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Recent'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppStyle.black,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (route) => false);
                },
                icon: const Icon(FontAwesomeIcons.gear))
          ],
        ),
        backgroundColor: AppStyle.black,
        body: BlocConsumer<RecentSeriesCubit, RecentSeriesState>(
          listener: (context, state) {
            if (state is RecentSeriesError) {
              exceptionDialog(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is RecentSeriesLoading) {
              return const CustomProgressIndicator();
            } else if (state is RecentSeriesLoaded) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 50.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                    itemCount: state.listOfSeries.results!.length,
                    itemBuilder: (context, index) => RecentSerieItem(
                          movie: state.listOfSeries.results![index],
                        )),
              );
            }
            return Container();
          },
        ),
      );
}
