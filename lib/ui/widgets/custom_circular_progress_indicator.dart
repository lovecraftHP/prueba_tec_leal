import 'package:flutter/material.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(
          color: AppStyle.mainColor,
        ),
      );
}
