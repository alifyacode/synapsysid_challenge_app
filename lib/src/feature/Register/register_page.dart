import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/data/db/db.dart';
import 'package:synapsysid_challenge_app/src/core/data/model/user.dart';
import 'package:synapsysid_challenge_app/src/core/ui/helpers/size_helpers.dart';
import 'package:synapsysid_challenge_app/src/core/ui/styles/colors_app.dart';
import 'package:synapsysid_challenge_app/src/core/ui/styles/text_styles.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/back_arrow.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/bottom_link.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/title_subTitle_widget.dart';
import 'package:synapsysid_challenge_app/src/feature/Register/register_controller.dart';
import 'package:provider/provider.dart';

import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/widgets/custom_button.dart';
import '../../core/ui/widgets/custom_input_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage> {
   late final RegisterController controller;
  @override
  void onReady() {
    super.onReady();

    controller = context.read<RegisterController>();
    controller.addListener(() {
      if (controller.state == RegisterState.loading) {
        showLoader();
      }
      if (controller.state == RegisterState.error) {
        showError("Registation error");
        hideLoader();
      }
      if (controller.state == RegisterState.success) {
        hideLoader();
        Navigator.of(context).popAndPushNamed('/auth');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
            child: const BackArrow(route: '/',)
          ),
          const TitleSubTitleWidget(
              title: "Create Account",
              subTitle: "Please fill the input blow here"),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: CustomInputTextfield(
                icon: Icon(
                  Icons.person_outline,
                  size: context.percentHeight(.03),
                ),
                label: "Name",
                onChanged: (value) {
                  controller.registerRequest = controller.registerRequest.copyWith(name: value);
                },
              )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: CustomInputTextfield(
                icon: Icon(
                  Icons.phone_android_outlined,
                  size: context.percentHeight(.03),
                ),
                label: "Phone",
                onChanged: (value) {
                  controller.registerRequest = controller.registerRequest.copyWith(phone: value);
                },
              )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: CustomInputTextfield(
                icon: Icon(
                  Icons.mail_outline,
                  size: context.percentHeight(.03),
                ),
                label: "Email",
                onChanged: (value) {
                  controller.registerRequest = controller.registerRequest.copyWith(email: value);
                },
              )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: CustomInputTextfield(
                icon: Icon(
                  Icons.lock_outline,
                  size: context.percentHeight(.03),
                ),
                label: "Password",
                obscureText: true,
                onChanged: (value) {
                  controller.registerRequest = controller.registerRequest.copyWith(password: value);
                },
              )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: CustomInputTextfield(
                icon: Icon(
                  Icons.lock_outline,
                  size: context.percentHeight(.03),
                ),
                label: "Confirm Password",
                obscureText: true,
                onChanged: (value) {
                  controller.confPassword = value;
                },
              )),
          SizedBox(
            height: context.percentHeight(.03),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: CustomButton(
              label: 'Sign up',
              onPressed: () {
                controller.registerAction();
              },
              height: context.percentHeight(.1),
            ),
          ),
          SizedBox(
            height: context.percentHeight(.1),
          ),
          const BottomLink(
              label: 'Already have an account? ',
              keyWord: 'Sign in',
              route: '/auth')
        ],
      ),
    );
  }
}
