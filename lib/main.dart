import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/api/network/login_api.dart';
import 'package:prueba_tec_leal/core/cubit/login_cubit.dart';
import 'package:prueba_tec_leal/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) => MultiBlocProvider(
            providers: [
              BlocProvider<LoginCubit>(
                create: (context) => LoginCubit(loginRepository: LoginApi()),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'Quicksand'),
              onGenerateRoute: Routes.onGenerateRoutes,
              initialRoute: 'splash',
            ),
          ));
}
