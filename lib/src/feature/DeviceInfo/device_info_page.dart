import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:synapsysid_challenge_app/src/core/ui/helpers/size_helpers.dart';



import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/back_arrow.dart';



class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);

  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {


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
                    child: Text("Device Info",textAlign: TextAlign.start,
                        style: TextStyles.instance.textBold.copyWith(fontSize: 35,)),
                  )
              ),

              Positioned(
                  top: 170,
                  right: 0,
                  left: 0,
                  child:
                  Column(
                    children: [
                      SizedBox(height: 40,),
                      ElevatedButton(
                          child: Container(
                            height: context.screenheight/5 ,
                            width: context.screenWidth-50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),

                                Container(
                                  height: context.screenheight/10 ,
                                  width: context.screenWidth/5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: Image.asset("assets/images/loginregister.png").image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    SizedBox(width: 8,),

                                    Text(
                                        "Sensor states".toUpperCase(),
                                        style: TextStyle(fontSize: 14)
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30,),

                              ],
                            ),
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(
                                  0xff7c59c3)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )
                              )
                          ),
                          onPressed: () =>  Navigator.of(context).popAndPushNamed('/sensorstate')
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                          child: Container(
                            height: context.screenheight/5 ,
                            width: context.screenWidth-50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),

                                Container(
                                  height: context.screenheight/10 ,
                                  width: context.screenWidth/5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: Image.asset("assets/images/loginregister.png").image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    SizedBox(width: 8,),

                                    Text(
                                        "GPS Coordinate".toUpperCase(),
                                        style: TextStyle(fontSize: 14)
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30,),

                              ],
                            ),
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(
                                  0xff7c59c3)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )
                              )
                          ),
                          onPressed: () => Navigator.of(context).popAndPushNamed('/gpscoordinate')
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                          child: Container(
                            height: context.screenheight/5 ,
                            width: context.screenWidth-50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),

                                Container(
                                  height: context.screenheight/10 ,
                                  width: context.screenWidth/5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: Image.asset("assets/images/loginregister.png").image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    SizedBox(width: 8,),

                                    Text(
                                        "Battery Level".toUpperCase(),
                                        style: TextStyle(fontSize: 14)
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30,),

                              ],
                            ),
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(
                                  0xff7c59c3)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )
                              )
                          ),
                          onPressed: () => Navigator.of(context).popAndPushNamed('/batterylevel')
                      ),
                      SizedBox(height: 40,),

                    ],
                  )
              ),

            ],
          ),
        ),
      ),
    );  }
}