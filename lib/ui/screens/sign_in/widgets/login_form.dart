import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tec_leal/core/cubit/login_cubit.dart';
import 'package:prueba_tec_leal/core/providers/login_provider.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_button.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:prueba_tec_leal/ui/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tec_leal/ui/widgets/dialogs/exception_dialog.dart';

final loginProvider =
    StateNotifierProvider<LoginProvider, LoginState>((ref) => LoginProvider());

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _nameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(
      loginProvider,
      (_, state) {
        if (state is LoginLoading) {
          showDialog(
              context: context,
              useSafeArea: true,
              builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: CustomProgressIndicator()));
        }
        if (state is LoginLoaded) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
        }
        if (state is LoginError) {
          Navigator.pop(context);
          exceptionDialog(context, state.message);
        }
      },
    );
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      const CloseButton(
        color: Colors.white,
      ),
      Form(
          key: widget._formKey,
          child: Column(
            children: [
              CustomTextFormField(
                title: 'Name',
                controller: _nameController,
                onChange: (value) {
                  setState(() {
                    _nameController.text = value;
                  });
                },
              ),
              CustomTextFormField(
                  title: 'Password',
                  obscure: true,
                  controller: _passwordController,
                  onChange: (value) {
                    setState(() {
                      _passwordController.text = value;
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(top: 80.h),
                child: CustomButton(
                    title: 'Log in',
                    onPress: () async {
                      widget._formKey.currentState!.save();
                      ref.read(loginProvider.notifier).signIn(
                          _nameController.text, _passwordController.text);
                    }),
              )
            ],
          ))
    ]);
  }
}
