import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static Color mainColor = const Color(0xffFFD233);
  static Color black = const Color(0xff191919);
  static Color gray = const Color(0xff8C8C8C);

  //----------------------------TEXTSTYLE----------------------------------------
  static TextStyle movieTitile1 =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500);

  static TextStyle movieTitile2 = TextStyle(
      fontSize: 23.sp,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(color: AppStyle.black, blurRadius: 2, offset: const Offset(1, 1))
      ]);
  static TextStyle movieTitile3 =
      TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w800);
  static TextStyle movieTitle4 =
      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold);

  static TextStyle subsitile1 =
      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700);

  //------------------------- TABS STYLE ---------------------------------------
  static TextStyle tabTitle1 =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800);
}
