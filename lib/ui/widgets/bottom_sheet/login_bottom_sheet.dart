import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tec_leal/core/cubit/login_cubit.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_button.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_text_form_field.dart';

var radius = const Radius.circular(40);

class LoginBottomSheet {
  final GlobalKey<FormState> key;
  final BuildContext context;
  LoginBottomSheet({required this.key, required this.context});

  void singUpBottomSheet() {}
}
