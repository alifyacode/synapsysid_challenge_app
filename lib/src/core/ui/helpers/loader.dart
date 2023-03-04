import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:synapsysid_challenge_app/src/core/ui/styles/colors_app.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isloaded = false;

  void showLoader() {
    if (!isloaded) {
      isloaded = true;
      showDialog(
        context: context,
        builder: (context) {
          return LoadingAnimationWidget.fourRotatingDots(color: ColorsApp.instance.grey, size: 60);
        },
      );
    }
  }

  void hideLoader(){
    if(isloaded){
      isloaded = false;
      Navigator.of(context).pop();
    }
  }
}
