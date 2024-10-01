import 'package:flutter/material.dart';
import 'package:inspira/app/data/services/auth_service.dart';

class LoginController {
  var isLoading$ = ValueNotifier(false);
  bool get isLoading => isLoading$.value;

  Future<bool> login({
    required String email,
    required String password,
    required AuthService auth,
  }) async {
    isLoading$.value = true;

    try {
      await auth.login(email, password);

      final user = auth.user;

      if (user != null) {
        isLoading$.value = false;
        return true;
      }

      isLoading$.value = false;
      return false;
    } on AuthException {
      isLoading$.value = false;
      return false;
    }
  }
}
