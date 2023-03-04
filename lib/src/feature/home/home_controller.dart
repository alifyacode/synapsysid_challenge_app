import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/dto/global_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum HomeState {
  idle,
  loading,
  success,
  error,
  reload,
}

class HomeController extends ChangeNotifier {
  static Map<String, dynamic> userLogged = {};
  var state = HomeState.idle;

  Future<void> verifyIsLogged() async {
    state = HomeState.loading;
    notifyListeners();
    log('chego aqui 1');
    try {
      final shared = await SharedPreferences.getInstance();
      log('chego aqui 2');
      userLogged = jsonDecode(shared.getString('UserLogged'));
      log('chego aqui 3');
      GlobalUser.isLogged = true;
      state = HomeState.success;
      notifyListeners();
      log('$userLogged');
    } on Exception catch (e, s) {
      log('verify error', error: e, stackTrace: s);
      state = HomeState.error;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    state = HomeState.loading;
    notifyListeners();
    try {
      userLogged.clear();
      final shared = await SharedPreferences.getInstance();
      await shared.setString('UserLogged', '');
      notifyListeners();
      state = HomeState.reload;
      notifyListeners();
    } on Exception catch (e, s) {
      log('Sign out error', error: e, stackTrace: s);
      state = HomeState.error;
      notifyListeners();
    }
  }
}
