import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tec_leal/core/api/repository/login_repository.dart';
import 'package:prueba_tec_leal/core/exceptions/login_exception.dart';
import 'package:prueba_tec_leal/core/models/sign_in_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  Future<bool> login(String username, String password) async {
    emit(LoginLoading());
    try {
      var credentials = SignInModel(username: username, password: password);
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
}
