import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tec_leal/core/cubit/login_cubit.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_button.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tec_leal/ui/widgets/dialogs/exception_dialog.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          // Navigator.pop(context);
          showDialog(
              context: context,
              useSafeArea: true,
              builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: CustomProgressIndicator()));
        }

        if (state is LoginError) {
          Navigator.pop(context);
          exceptionDialog(context, state.message);
        }
        if (state is LoginLoaded) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
        }
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        const CloseButton(
          color: Colors.white,
        ),
        Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  title: 'Name',
                  controller: context.read<LoginCubit>().nameController,
                  onChange: (value) {
                    context.read<LoginCubit>().nameController = value;
                  },
                ),
                CustomTextFormField(
                    title: 'Password',
                    obscure: true,
                    controller: context.read<LoginCubit>().passwordController,
                    onChange: (value) {
                      context.read<LoginCubit>().passwordController = value;
                    }),
                Padding(
                  padding: EdgeInsets.only(top: 80.h),
                  child: CustomButton(
                      title: 'Log in',
                      onPress: () {
                        _formKey.currentState!.save();
                        context.read<LoginCubit>().login();
                      }),
                )
              ],
            ))
      ]),
    );
  }
}
