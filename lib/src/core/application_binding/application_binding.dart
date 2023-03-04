import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/dto/global_user.dart';
import 'package:synapsysid_challenge_app/src/feature/Auth/auth_controller.dart';
import 'package:provider/provider.dart';

import '../../feature/Register/register_controller.dart';
import '../../feature/home/home_controller.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;
  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => AuthController())),
        ChangeNotifierProvider(create: ((context) => RegisterController())),
        ChangeNotifierProvider(create: ((context) => HomeController())),
        Provider(create: ((context) => GlobalUser()))
      ],
      child: child,
    );
  }
}
