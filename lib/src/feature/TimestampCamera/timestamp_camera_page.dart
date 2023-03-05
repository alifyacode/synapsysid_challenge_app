import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:stamp_image/stamp_image.dart';
import 'package:synapsysid_challenge_app/src/core/ui/helpers/size_helpers.dart';

import '../../core/ui/styles/text_styles.dart';

class TimestampCameraPage extends StatefulWidget {
  @override
  _TimestampCameraPageState createState() => _TimestampCameraPageState();
}

class _TimestampCameraPageState extends State<TimestampCameraPage> {
  final picker = ImagePicker();
  File? image;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        GestureDetector(
          onTap: () => Navigator.of(context).pushReplacementNamed("/"),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),

        title: const Text('TimeStamp Image and Camera'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageWidget(),
            SizedBox(height: 10),
            _buttonCamera()
          ],
        ),
      ),
    );
  }

  Widget _buttonCamera() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          pickImage(ImageSource.camera);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          "Camera",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }


  Widget _imageWidget() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: context.screenheight/1.6,
      child:
      Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child:
            image != null ? Image.file(image!) :
            Container( width: MediaQuery.of(context).size.width / 1.1,
              height: context.screenheight/1.6,
              color: Colors.grey,
              child:
              GestureDetector(
                onTap: () {
                  pickImage(ImageSource.camera);
                },
                  child: Icon(Icons.camera_alt,size: MediaQuery.of(context).size.width / 10,)
              )
              ,
            ),

          ),
          image != null ?  Positioned(
              left: 20,
              bottom: 40,
              child:
              Container(
                width: context.screenWidth,
                child:
                Text(
                  DateTime.now().toString(),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
          ) :
          SizedBox.shrink(),

        ],
      )
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await await picker.getImage(source: source);
      if(image == null) return;

      final imageTemporary = File(image.path);
      print(imageTemporary);


      setState(() => this.image = imageTemporary);

    } on PlatformException catch(e) {
      print('failed to pick image');
    }}
}