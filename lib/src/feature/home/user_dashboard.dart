import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:synapsysid_challenge_app/src/core/ui/helpers/size_helpers.dart';



import '../../core/ui/styles/text_styles.dart';



class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  // String formattedTime = DateFormat('kk:mm').format(DateTime.now());
  late Timer _timer;
  String formattedDate = DateFormat("EEE dd MMM HH:mm").format(DateTime.now().toLocal());

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) => _update());
  }

  void _update() {
    setState(() {
      // formattedTime = DateFormat('kk:mm').format(DateTime.now());
      formattedDate = DateFormat("EEE dd MMM HH:mm").format(DateTime.now().toLocal());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // bottomOpacity: 0.0,
        elevation: 0.0,
        leading: Icon(Icons.more_vert),
        // title: Text('BelajarFlutter.com'),
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.info_rounded, color: Colors.white), onPressed: () {  },),
        ],
      ),
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
              Container(
                height: context.screenheight /8 ,
                width: context.screenWidth*2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset("assets/images/wave.png").image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ),
            Positioned(
                top: 110,
                right: 0,
                left: 0,
                child:
                Column(
                  children: [
                    Center(
                      child: Text("SynapsysId\nChallenge",textAlign: TextAlign.center,
                          style: TextStyles.instance.textBold.copyWith(fontSize: 35,)),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Text(formattedDate,textAlign: TextAlign.center,
                          style: TextStyles.instance.textMedium.copyWith(fontSize: 15,color: Colors.grey)),
                    ),
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
                                      "GPS Map".toUpperCase(),
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
                        onPressed: () => null
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            child: Container(
                              height: context.screenheight/5 ,
                              width: context.screenWidth/2.6,
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
                                          "Device Info".toUpperCase(),
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
                            onPressed: () => Navigator.of(context).popAndPushNamed('/deviceinfo')

                        ),

                        ElevatedButton(
                            child: Container(
                              height: context.screenheight/5 ,
                              width: context.screenWidth/2.6,
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
                                          "TimeStamp Camera".toUpperCase(),
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
                                    0xff7c59c3)),                                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    )
                                )
                            ),
                            onPressed: () => null
                        ),

                      ],
                    )
                  ],
                )
            ),

          ],
        ),
      ),
    );  }
}