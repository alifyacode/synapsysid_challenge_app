import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:synapsysid_challenge_app/src/core/ui/helpers/size_helpers.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/custom_button.dart';
import 'package:synapsysid_challenge_app/src/feature/home/home_controller.dart';
import 'package:provider/provider.dart';

import '../../core/ui/styles/text_styles.dart';
import '../Auth/auth_page.dart';

class UserProfilePage extends StatelessWidget {
  final Map<String, dynamic> user;
  const UserProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Scaffold(
      appBar: AppBar(
        leading:
        GestureDetector(
          onTap: () => Navigator.of(context).pushReplacementNamed("/"),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),

        title: const Text('User Profile Page'),
      ),
      body: Container(
        height: context.screenheight ,
        width: context.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('name: ${user['name']}', style: TextStyles.instance.textBold.copyWith(fontSize: 20),),
                Text('phone: ${user['phone']}', style: TextStyles.instance.textBold.copyWith(fontSize: 20),),
                Text('email: ${user['email']}', style: TextStyles.instance.textBold.copyWith(fontSize: 20),),
                SizedBox(height: 20.0,),
                CustomButton(label:  'Sign out', width: context.screenWidth,onPressed: () {controller.signOut(); Navigator.of(context).pushReplacementNamed("/auth");},),
                SizedBox(height: 100.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
