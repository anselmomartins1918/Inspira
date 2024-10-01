import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;


  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? userListener) {
      user = (userListener == null) ? userListener : null;
      notifyListeners();
    });
  }

  _getUser() {
    user = _auth.currentUser;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw AuthException('Verifique suas credenciais!');
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    _getUser();
  }
}