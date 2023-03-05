import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:synapsysid_challenge_app/src/core/ui/helpers/size_helpers.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/back_arrow.dart';



class AppDevDetailPage extends StatefulWidget {
  const AppDevDetailPage({Key? key}) : super(key: key);

  @override
  _AppDevDetailPageState createState() => _AppDevDetailPageState();
}

class _AppDevDetailPageState extends State<AppDevDetailPage> {
  String manufacturer = '';
  String model = '';
  String deviceBuild = '';
  String SDK = '';
  String versionCode = '';



  Future<void>_deviceDetails() async{
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;

        setState(() {
          manufacturer = build.manufacturer;
          model = build.model;
          deviceBuild = build.id;
          SDK = build.version.sdkInt.toString();
          versionCode = build.version.release;
        });
        //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        setState(() {
          manufacturer = data.utsname.machine;
          model = data.model;
          deviceBuild = data.utsname.nodename;
          SDK = data.utsname.release;
          versionCode = data.utsname.version;
        });//UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

  }


  @override
  void initState() {
    super.initState();
    _deviceDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        body: Container(
          height: context.screenheight ,
          width: context.screenWidth,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child:
                  Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: const BackArrow(route: '/',color: Colors.white),
                        ),
                        color: Color(
                            0xff7c59c3),
                      ),

                      Container(
                        height: context.screenheight /8 ,
                        width: context.screenWidth*2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.asset("assets/images/wave.png").image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Positioned(
                  top: 150,
                  left: 10,
                  child:
                  Container(
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        Text("Application Development Details",textAlign: TextAlign.start,
                            style: TextStyles.instance.textBold.copyWith(fontSize: 35,)),
                      ],
                    ),
                  )
              ),
              Positioned(
                  top: 280,
                  left: 14,
                  child:
                  Container(
                    width: context.screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Data SoC",textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                        ),

                        Text(
                            'Manufacturer : $manufacturer',textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 20)
                        ),
                        Text(
                            'Model : $model',textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 20)
                        ),
                        Text(
                            'Build : $deviceBuild',textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 20)
                        ),
                        Text(
                            'SDK : $SDK',textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 20)
                        ),
                        Text(
                            'Version Code : $versionCode',textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 20)
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );  }
}