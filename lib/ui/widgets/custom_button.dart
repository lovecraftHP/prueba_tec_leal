import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onPress;
  const CustomButton({
    Key? key,
    required this.title,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(color: textColor, fontSize: 20.sp),
          ),
        ));
  }
}
