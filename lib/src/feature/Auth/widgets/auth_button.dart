import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/ui/helpers/size_helpers.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/widgets/custom_button.dart';
import '../auth_controller.dart';

class AuthButton extends StatelessWidget {

  const AuthButton({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    //final controller = context.watch<AuthController>();
       return  Consumer<AuthController>(builder: (context, controller, child){
            return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: CustomButton(
              label: 'Sign in',
              onPressed: () {
                controller.loginAction();
              },
              height: context.percentHeight(.1),
            ),
          );
          });
  }
}