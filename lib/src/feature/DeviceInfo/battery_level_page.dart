import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

class BatteryLevelPage extends StatefulWidget {
  const BatteryLevelPage({Key? key}) : super(key: key);

  @override
  _BatteryLevelPageState createState() => _BatteryLevelPageState();
}

class _BatteryLevelPageState extends State<BatteryLevelPage> {
  var battery = Battery();
  int level = 100;
  BatteryState batteryState = BatteryState.full;
  late Timer timer;
  late StreamSubscription streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBatteryPercentage();
    getBatteryState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      getBatteryPercentage();
    });
  }

  void getBatteryPercentage() async {
    final batteryLevel = await battery.batteryLevel;

    this.level = batteryLevel;

    setState(() {});
  }

  void getBatteryState() {
    streamSubscription = battery.onBatteryStateChanged.listen((state) {
      setState(() {
        this.batteryState = state;
      });
    });
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    timer.cancel();
  }

  Widget BuildBattery(BatteryState state) {
    switch (state) {
      case BatteryState.full:
        return Container(
          child: Icon(
            Icons.battery_full,
            size: 200,
            color: Colors.green,
          ),
          width: 200,
          height: 200,
        );
      case BatteryState.charging:
        return Container(
          child:
          Icon(Icons.battery_charging_full, size: 200, color: Colors.blue),
          width: 200,
          height: 200,
        );

      case BatteryState.discharging:
        return Container(
          child:
          level==100?
          Icon(
            Icons.battery_full,
            size: 200,
            color: Colors.green,
          ) :
          level==0? Icon(
            Icons.battery_alert,
            size: 200,
            color: Colors.red,
          ) :
          Icon(Icons.battery_full, size: 200, color: Colors.grey),
          width: 200,
          height: 200,
        );


      case BatteryState.unknown:

      default:
        return Container(
          child: Icon(Icons.battery_full, size: 200, color: Colors.grey),
          width: 200,
          height: 200,
        );


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        GestureDetector(
          onTap: () => Navigator.of(context).pushReplacementNamed("/deviceinfo"),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),

        title: const Text('Battery Level Page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildBattery(batteryState),
              Text(
                '${level} %',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}