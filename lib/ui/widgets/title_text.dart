import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      sliver: SliverToBoxAdapter(
        child: Text(
          title,
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
