import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/cubit/login_cubit.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/widgets/bottom_sheet/login_bottom_sheet.dart';

import '../../widgets/custom_button.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<LoginCubit>().dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.35), BlendMode.luminosity)),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(
                        onPress: () {},
                        title: 'Sign up',
                        backgroundColor: AppStyle.mainColor),
                    SizedBox(height: 5.h),
                    CustomButton(
                        title: 'Log in',
                        onPress: () {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: radius, topRight: radius)),
                              backgroundColor: AppStyle.black.withOpacity(.88),
                              isDismissible: false,
                              builder: (context) {
                                return LoginForm(formKey: _formKey);
                              });
                        }),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, left: 10.w),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            shadows: const [
                              Shadow(
                                  color: Colors.black,
                                  offset: Offset(0, -12),
                                  blurRadius: 55),
                              Shadow(
                                  color: Colors.black,
                                  offset: Offset(-1, 22),
                                  blurRadius: 55)
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
