import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/widgets/card/movie_info_card.dart';
import 'package:prueba_tec_leal/ui/widgets/subtitle_widget.dart';

class ShowTimeScreen extends ConsumerStatefulWidget {
  const ShowTimeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowTimeScreenState();
}

class _ShowTimeScreenState extends ConsumerState<ShowTimeScreen> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: 13.w, top: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubtitleWidget(title: 'Date'),
            SizedBox(height: 20.h),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              height: 100.h,
              width: 80.w,
              dateTextStyle: const TextStyle(color: Colors.white),
              dayTextStyle: const TextStyle(color: Colors.white),
              monthTextStyle: const TextStyle(color: Colors.white),
              selectionColor: AppStyle.mainColor,
              selectedTextColor: AppStyle.black,
            ),
            SizedBox(height: 20.h),
            const MovieInfoCard(
                title: 'Cine 1', subtitle: 'Direccion del cine 1'),
            const MovieInfoCard(
                title: 'Cine 2', subtitle: 'Direccion del cine 2'),
            const MovieInfoCard(
                title: 'Cine 3', subtitle: 'Direccion del cine 3')
          ],
        ),
      );
}
