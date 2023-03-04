import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:synapsysid_challenge_app/src/core/dto/global_user.dart';
import 'package:synapsysid_challenge_app/src/feature/Auth/models/auth_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/data/db/db.dart';
import '../../core/data/model/user.dart';

enum AuthState {idle, loading, success, error}

class AuthController extends ChangeNotifier {
  final DB _db = DB();
  var authRequest = AuthRequestModel('', '');

  var state = AuthState.idle;

  Future<void> loginAction() async {
    final shared = await SharedPreferences.getInstance();
    state = AuthState.loading;
    notifyListeners();
    Future.delayed(const Duration(seconds: 100));
    try {
      final response = await _db.getUser(authRequest);
      GlobalUser.globalUser = User.fromMap(response[0]);
      await shared.setString('UserLogged', GlobalUser.globalUser?.toJson());
      state = AuthState.success;
      notifyListeners();
    } catch (e, s) {
      state = AuthState.error;
      notifyListeners();
      log("Authentication error", error: e, stackTrace: s);
    }
  }
}
