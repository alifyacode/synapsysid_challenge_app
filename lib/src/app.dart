import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/application_binding/application_binding.dart';
import 'package:synapsysid_challenge_app/src/feature/Auth/auth_page.dart';
import 'package:synapsysid_challenge_app/src/feature/Register/register_page.dart';
import 'package:synapsysid_challenge_app/src/feature/home/home_page.dart';
import 'core/ui/theme/theme_config.dart';
import 'feature/device_info_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Synapsys Id Challenge',
        initialRoute: '/',
        routes: {
          '/':(context) => HomePage(),
          '/auth':(context) => AuthPage(),
          '/register':(context) => RegisterPage(),
          '/deviceinfo':(context) => DeviceInfoPage()
        },
        theme: ThemeConfig.theme
      ),
    );
  }
}