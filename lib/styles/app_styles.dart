import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static Color mainColor = Color(0xffFFD233);
  static Color black = Color(0xff191919);
  static Color gray = Color(0xff8C8C8C);

  //----------------------------TEXTSTYLE----------------------------------------
  static TextStyle movieTitile1 =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500);

  static TextStyle movieTitile2 = TextStyle(
      fontSize: 23.sp,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(color: AppStyle.black, blurRadius: 2, offset: const Offset(1, 1))
      ]);
}
