import 'package:flutter/material.dart';
import 'core/ui/theme/theme_config.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Login and Register system',
        theme: ThemeConfig.theme
      ),
    );
  }
}