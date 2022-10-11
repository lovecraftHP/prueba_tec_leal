import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/widgets/subtitle_widget.dart';

class MovieInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const MovieInfoCard({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: SubtitleWidget(title: title),
          subtitle: Text(subtitle, style: TextStyle(color: AppStyle.gray)),
          trailing: Icon(Icons.arrow_forward_ios_rounded, color: AppStyle.gray),
        ),
        Container(
          width: double.maxFinite,
          child: Card(
            color: Colors.grey.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 13.w),
                    child:
                        Text('info of the title', style: AppStyle.subsitile1),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: List.generate(
                        6,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 4.h),
                              child: Container(
                                width: 80.w,
                                height: 40.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppStyle.gray,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("$index"),
                              ),
                            )).toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
