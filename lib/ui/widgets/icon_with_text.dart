import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String title;
  const IconWithText({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: AppStyle.mainColor,
            ),
            SizedBox(width: 5.w),
            Text(title)
          ],
        ),
      );
}
