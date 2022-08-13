import 'package:prueba_tec_leal/core/api/repository/login_repository.dart';
import 'package:prueba_tec_leal/core/exceptions/login_exception.dart';
import 'package:prueba_tec_leal/core/models/sign_in_model.dart';

class LoginApi implements LoginRepository {
  @override
  Future<bool> singIn(SignInModel credentials) async {
    bool response;
    var condition1 =
        credentials.username == "maria" && credentials.password == "password";
    var condition2 =
        credentials.username == "pedro" && credentials.password == "123456";
    try {
      if (condition1) {
        response = true;
      } else {
        response = false;
      }
      await Future.delayed(const Duration(seconds: 2));
    } on Exception catch (_) {
      throw LoginException(
          message: "Error de credenciales, verfica el usuario o la password");
    }
    return response;
  }
}
