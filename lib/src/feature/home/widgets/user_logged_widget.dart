import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/custom_button.dart';
import 'package:synapsysid_challenge_app/src/feature/home/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/styles/text_styles.dart';
import '../../Auth/auth_page.dart';

class UserLoggedWidget extends StatelessWidget {
  final Map<String, dynamic> user;
  const UserLoggedWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('id: ${user['id']}', style: TextStyles.instance.textBold.copyWith(fontSize: 20),),
          Text('name: ${user['name']}', style: TextStyles.instance.textBold.copyWith(fontSize: 20),),
          Text('phone: ${user['phone']}', style: TextStyles.instance.textBold.copyWith(fontSize: 20),),
          Text('email: ${user['email']}', style: TextStyles.instance.textBold.copyWith(fontSize: 20),),
          Text('password: ${user['password']}', style: TextStyles.instance.textBold.copyWith(fontSize: 20),),
            CustomButton(label:  'Sign out', onPressed: () {controller.signOut(); AuthPage();},),
          SizedBox(height: 100.0,),

          // Text(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.now().toLocal())
          //   , style: TextStyles.instance.textBold.copyWith(fontSize: 20),),

      Text(DateFormat("EEE dd MMM HH:mm").format(DateTime.now().toLocal())
            , style: TextStyles.instance.textBold.copyWith(fontSize: 20),),

          // Text(DateFormat("HH:mm").format(DateTime.now().toLocal())
          //   , style: TextStyles.instance.textBold.copyWith(fontSize: 20),),

        ],
      ),
    );
  }
}
