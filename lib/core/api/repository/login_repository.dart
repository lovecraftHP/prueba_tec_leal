import 'package:prueba_tec_leal/core/models/sign_in_model.dart';

abstract class LoginRepository {
  Future<bool> singIn(SignInModel credentials);
}
