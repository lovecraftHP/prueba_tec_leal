import 'package:flutter/cupertino.dart';

class LoginException implements Exception {
  final String message;

  LoginException({required this.message});
}
