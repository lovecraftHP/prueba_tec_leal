import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/cubit/login_cubit.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/widgets/bottom_sheet/login_bottom_sheet.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _name = TextEditingController();

  final _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
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
                                          key: _formKey,
                                          child: BlocConsumer<LoginCubit,
                                              LoginState>(
                                            listener: (context, state) {
                                              if (state is LoginLoading) {
                                                showDialog(
                                                    context: context,
                                                    useSafeArea: true,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          content: Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: AppStyle
                                                                  .mainColor,
                                                            ),
                                                          ),
                                                        ));
                                              }

                                              if (state is LoginError) {
                                                // Navigator.pop(context);
                                                showDialog(
                                                    context: context,
                                                    builder: (builder) =>
                                                        AlertDialog(
                                                          actions: [
                                                            CustomButton(
                                                              title: 'Cerrar',
                                                              backgroundColor:
                                                                  AppStyle
                                                                      .mainColor,
                                                              onPress: () {
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                              },
                                                            )
                                                          ],
                                                          content: Text(
                                                              state.message),
                                                        ));
                                              }
                                              if (state is LoginLoaded) {
                                                Navigator.pop(context);
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        'home',
                                                        (route) => false);
                                              }
                                            },
                                            builder: (context, state) {
                                              return Column(
                                                children: [
                                                  CustomTextFormField(
                                                    title: 'Name',
                                                    controller: context
                                                        .read<LoginCubit>()
                                                        .nameController,
                                                    onChange: (value) {
                                                      context
                                                              .read<LoginCubit>()
                                                              .nameController =
                                                          value;
                                                    },
                                                  ),
                                                  CustomTextFormField(
                                                      title: 'Password',
                                                      controller: context
                                                          .read<LoginCubit>()
                                                          .passwordController,
                                                      onChange: (value) {
                                                        context
                                                            .read<LoginCubit>()
                                                            .passwordController = value;
                                                      }),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 80.h),
                                                    child: CustomButton(
                                                        title: 'Log in',
                                                        onPress: () {
                                                          _formKey.currentState!
                                                              .save();
                                                          context
                                                              .read<
                                                                  LoginCubit>()
                                                              .login();
                                                        }),
                                                  )
                                                ],
                                              );
                                            },
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
