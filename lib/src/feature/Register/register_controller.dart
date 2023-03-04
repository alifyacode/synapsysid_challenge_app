import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/data/model/user.dart';

import '../../core/data/db/db.dart';

enum RegisterState { idle, loading, success, error }

class RegisterController extends ChangeNotifier {
  final DB _db = DB();
  var registerRequest = User(name: "", phone: "", email: '', password: '');
  var confPassword = '';
  var state = RegisterState.idle;

  Future<void> registerAction() async {
    state = RegisterState.loading;
    notifyListeners();
    if (confPassword == registerRequest.password) {
      try {
        var response = await _db.insertUser(registerRequest);
        state = RegisterState.success;
        notifyListeners();
      } catch (e, s) {
        log('Sign up error', error: e, stackTrace: s);
        state = RegisterState.error;
        notifyListeners();
      }
    } else {
      state = RegisterState.error;
      notifyListeners();
      return;
    }
  }
}
