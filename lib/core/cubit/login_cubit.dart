import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tec_leal/core/api/repository/login_repository.dart';
import 'package:prueba_tec_leal/core/exceptions/login_exception.dart';
import 'package:prueba_tec_leal/core/models/sign_in_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginRepository loginRepository;

  TextEditingController get nameController => _nameController;
  TextEditingController get passwordController => _passwordController;

  set nameController(value) {
    _nameController.text = value;
  }

  set passwordController(value) {
    _passwordController.text = value;
  }

  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  Future<bool> login() async {
    emit(LoginLoading());
    try {
      var credentials = SignInModel(
          username: _nameController.value.text,
          password: _passwordController.value.text);
      var res = await loginRepository.singIn(credentials);
      if (res) {
        emit(LoginLoaded());
      } else {
        emit(const LoginError(
            message: 'Error de credenciales, revisa el usuario o password'));
      }
    } on LoginException catch (e) {
      emit(LoginError(message: e.message));
    }
    return false;
  }

  void debugController() {
    print(_nameController.text);
    print(_passwordController.text);
  }

  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
  }
}
