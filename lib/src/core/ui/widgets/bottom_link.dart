import 'package:flutter/material.dart';

import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

class BottomLink extends StatelessWidget {
  final String label;
  final String keyWord;
  final String route;
  const BottomLink({ Key? key, required this.label, required this.keyWord, required this.route }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label,
            style: TextStyles.instance.textRegular.copyWith(fontSize: 15)),
        InkWell(
          child: Text(
            keyWord,
            style: TextStyles.instance.textRegular
                .copyWith(fontSize: 15, color: ColorsApp.instance.primaryColor),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, route);
          },
        )
      ],
    );
  }
}