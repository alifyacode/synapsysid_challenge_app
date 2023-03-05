import 'package:flutter/material.dart';

import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

class BackArrow extends StatelessWidget {
  final String route;
  final Color? color;
  const BackArrow({ Key? key, required this.route,this.color }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: color??ColorsApp.instance.grey,
                  ),
                  Expanded(
                      child: Text(
                    'Back',
                    style: TextStyles.instance.textBold.copyWith(fontSize: 15,color: color??ColorsApp.instance.grey),
                  ))
                ],
              ),
              onTap: () => Navigator.of(context).pushReplacementNamed(route),
            );
  }
}