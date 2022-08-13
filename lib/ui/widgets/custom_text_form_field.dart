import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscure;
  final Function onChange;
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.controller,
    this.obscure = false,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          onSaved: (value) => onChange(value),
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: title,
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
