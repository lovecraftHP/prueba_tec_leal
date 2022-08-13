import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool obscure;
  const CustomTextFormField({
    Key? key,
    required this.text,
    required this.controller,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          cursorColor: Colors.white,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: text,
            labelStyle: const TextStyle(
              color: Colors.white,
            ),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
          ),
        ),
      );
}
