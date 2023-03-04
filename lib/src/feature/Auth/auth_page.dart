import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/ui/helpers/size_helpers.dart';
import 'package:synapsysid_challenge_app/src/core/ui/styles/colors_app.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/bottom_link.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/custom_button.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/custom_input_textfield.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/title_subTitle_widget.dart';
import 'package:synapsysid_challenge_app/src/feature/Auth/models/auth_request_model.dart';
import 'package:synapsysid_challenge_app/src/feature/Auth/widgets/auth_button.dart';
import 'package:provider/provider.dart';
import '../../core/data/db/db.dart';
import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/styles/text_styles.dart';
import 'auth_controller.dart';
import '../../core/data/model/user.dart';

class AuthPage extends StatefulWidget {
  AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends BaseState<AuthPage> {
  late final AuthController controller;

  @override
  void onReady() {
    super.onReady();
    controller = context.read<AuthController>();
    if(mounted){
      controller.addListener(() {
      if (controller.state == AuthState.loading) {
        showLoader();
      }
      if (controller.state == AuthState.error) {
        showError("Authentication error");
        hideLoader();
      }
      if (controller.state == AuthState.success) {
        hideLoader();
        Navigator.of(context).popAndPushNamed('/');
        showSuccess('user logged in successfully');
      }
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: context.percentHeight(.4),
            width: double.infinity,
            child: Image.asset("assets/images/loginregister.png"),
          ),
          const TitleSubTitleWidget(title: "Login", subTitle: 'Please sign in to continue'),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: CustomInputTextfield(
                icon: Icon(
                  Icons.mail_outline,
                  size: context.percentHeight(.03),
                ),
                label: "Email",
                onChanged: (value) {
                  controller.authRequest =
                      controller.authRequest.copyWith(email: value);
                  log("auth_email: ${controller.authRequest.email}");
                },
              )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: CustomInputTextfield(
                icon: Icon(
                  Icons.lock_outline,
                  size: context.percentHeight(.03),
                ),
                label: "Password",
                obscureText: true,
                onChanged: (value) {
                  controller.authRequest =
                      controller.authRequest.copyWith(password: value);
                  log("auth_pass: ${controller.authRequest.password}");
                },
              )),
          SizedBox(
            height: context.percentHeight(.03),
          ),
         const AuthButton(),
          SizedBox(
            height: context.percentHeight(.1),
          ),
         const BottomLink(label: 'Dont have an account? ', keyWord: 'Sign up', route: '/register')
        ],
      ),
    );
  }
}
