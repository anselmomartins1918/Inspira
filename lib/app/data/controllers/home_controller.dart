import 'package:flutter/material.dart';
import 'package:inspira/app/data/services/auth_service.dart';

class HomeController {
  final AuthService auth;

  HomeController({
    required this.auth,
  }) {
    setName();
  }

  ValueNotifier<String?> name$ = ValueNotifier<String?>(null);
  String? get name => name$.value;

  void setName() {
    String? email = auth.user?.email;

    String aux = email?.split('.')[0] ?? 'Visitante';

    name$.value = aux[0].toUpperCase() + aux.substring(1);
  }
}
