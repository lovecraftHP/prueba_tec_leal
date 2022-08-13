import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _name = TextEditingController();
  final _password = TextEditingController();

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
                          var radius = const Radius.circular(40);
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: radius, topRight: radius)),
                              backgroundColor: AppStyle.black.withOpacity(.88),
                              isDismissible: false,
                              builder: (context) {
                                return Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          padding: EdgeInsets.only(right: 10.w),
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Colors.white,
                                          )),
                                      Form(
                                          child: Column(
                                        children: [
                                          CustomTextFormField(
                                              text: 'Name', controller: _name),
                                          CustomTextFormField(
                                              text: 'Password',
                                              controller: _password),
                                          Padding(
                                            padding: EdgeInsets.only(top: 80.h),
                                            child: CustomButton(
                                                title: 'Log in',
                                                onPress: () {}),
                                          )
                                        ],
                                      ))
                                    ]);
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
