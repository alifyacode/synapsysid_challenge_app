import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/custom_button.dart';
import 'package:synapsysid_challenge_app/src/feature/home/home_controller.dart';
import 'package:provider/provider.dart';


import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/dto/global_user.dart';
import 'package:synapsysid_challenge_app/src/core/ui/widgets/custom_button.dart';
import 'package:synapsysid_challenge_app/src/feature/Auth/auth_page.dart';
import 'package:synapsysid_challenge_app/src/feature/home/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/styles/text_styles.dart';
import '../Auth/auth_controller.dart';


class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String formattedTime = DateFormat('kk:mm').format(DateTime.now());
  String hour = DateFormat('a').format(DateTime.now());
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) => _update());
  }

  void _update() {
    setState(() {
      formattedTime = DateFormat('kk:mm').format(DateTime.now());
      hour = DateFormat('a').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(formattedTime,  style: TextStyles.instance.textBold.copyWith(fontSize: 20),),
                  Padding(
                    padding: const EdgeInsets.only(top: 41.0, left: 10.0),
                    child: Text(
                      hour,
                      style:
                      TextStyles.instance.textBold.copyWith(fontSize: 20),                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}