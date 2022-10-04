import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tec_leal/core/api/repository/login_repository.dart';
import 'package:prueba_tec_leal/core/cubit/login_cubit.dart';
import 'package:prueba_tec_leal/core/exceptions/login_exception.dart';
import 'package:prueba_tec_leal/core/models/sign_in_model.dart';
import 'package:prueba_tec_leal/locator.dart';

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider() : super(LoginInitial());

  final _loginService = l.get<LoginRepository>();
  var _isAuth = false;

  bool get isAuth => _isAuth;

  void signIn(String username, String password) async {
    try {
      state = LoginLoading();
      var data = SignInModel(username: username, password: password);
      _isAuth = await _loginService.singIn(data);
      if (_isAuth) {
        state = LoginLoaded();
      } else {
        state = const LoginError(
            message: 'Error de credenciales, revisa el usuario o password');
      }
    } catch (e) {
      state = LoginError(message: e.toString());
    }
  }
}
