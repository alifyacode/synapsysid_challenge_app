import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/dto/global_user.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/custom_button.dart';
import 'package:synapsysid_challenge_app/src/feature/Auth/auth_page.dart';
import 'package:synapsysid_challenge_app/src/feature/home/user_dashboard.dart';
import 'package:synapsysid_challenge_app/src/feature/home/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/ui/base_state/base_state.dart';
import '../Auth/auth_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  late final HomeController controller;
  bool isLogged = false;
  @override
  void onReady() {
    super.onReady();
    controller = context.read<HomeController>();
    controller.verifyIsLogged();
    if (mounted) {
      controller.addListener((){
        if (controller.state == HomeState.loading) {
          showLoader();
        }
        if (controller.state == HomeState.error) {
          hideLoader();
        }
        if (controller.state == HomeState.success) {
          hideLoader();
          setState(() {
           isLogged = true;
          });
        }
        if( controller.state == HomeState.reload){
          hideLoader();
          setState(() {
           isLogged = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLogged == true
          ? UserDashboard()
      // UserLoggedWidget(user: (HomeController.userLogged))
          : AuthPage()
    );
  }
}
