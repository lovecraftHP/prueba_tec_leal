import 'package:flutter/material.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_button.dart';

Future<dynamic> exceptionDialog(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (builder) => AlertDialog(
            actions: [
              CustomButton(
                title: 'Cerrar',
                backgroundColor: AppStyle.mainColor,
                onPress: () => Navigator.pop(context),
              )
            ],
            content: Text(message),
          ));
}
