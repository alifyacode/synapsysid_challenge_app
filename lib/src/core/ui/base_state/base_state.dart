import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/ui/helpers/messages.dart';

import '../helpers/loader.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with Loader, Messages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}
