import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/widgets/subtitle_widget.dart';

class ShowTimeScreen extends ConsumerStatefulWidget {
  const ShowTimeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowTimeScreenState();
}

class _ShowTimeScreenState extends ConsumerState<ShowTimeScreen> {
  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.only(left: 13.w, top: 8.h),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          SubtitleWidget(title: 'Date'),
          SizedBox(height: 20.h),
          Placeholder(
            child: SizedBox(
              height: 100.h,
              width: double.maxFinite,
            ),
          ),
          SizedBox(height: 20.h),
          ListTile(
            title: SubtitleWidget(title: 'Cine1'),
            subtitle: Text('direccion del cine 1',
                style: TextStyle(color: AppStyle.gray)),
            trailing:
                Icon(Icons.arrow_forward_ios_rounded, color: AppStyle.gray),
          ),
          Card(
            color: Colors.grey.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 0,
            child: Container(
              width: double.maxFinite,
            ),
          ),
          ListTile(
            title: SubtitleWidget(title: 'Cine2'),
            subtitle: Text('direccion del cine 2',
                style: TextStyle(color: AppStyle.gray)),
            trailing:
                Icon(Icons.arrow_forward_ios_rounded, color: AppStyle.gray),
          ),
          Card(
            color: Colors.grey.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 0,
            child: Container(
              width: double.maxFinite,
            ),
          ),
          ListTile(
            title: SubtitleWidget(title: 'Cine3'),
            subtitle: Text('direccion del cine 3',
                style: TextStyle(color: AppStyle.gray)),
            trailing:
                Icon(Icons.arrow_forward_ios_rounded, color: AppStyle.gray),
          ),
          Card(
            color: Colors.grey.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 0,
            child: Container(
              width: double.maxFinite,
            ),
          ),
        ],
      ));
}
