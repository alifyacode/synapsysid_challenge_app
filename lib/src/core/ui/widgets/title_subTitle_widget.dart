import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class TitleSubTitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const TitleSubTitleWidget({ Key? key, required this.title, required this.subTitle }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Text(
              title,
              style: TextStyles.instance.textBold.copyWith(fontSize: 30),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, bottom: 10),
            child: Text(
              subTitle,
              style: TextStyles.instance.textRegular.copyWith(fontSize: 15),
            ),
          ),
        ],
       );
  }
}