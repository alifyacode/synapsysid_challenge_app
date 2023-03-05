import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stamp_image/stamp_image.dart';

class TimestampCameraPage extends StatefulWidget {
  @override
  _TimestampCameraPageState createState() => _TimestampCameraPageState();
}

class _TimestampCameraPageState extends State<TimestampCameraPage> {
  final picker = ImagePicker();
  File? image;

  void takePicture() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      await resetImage();

      StampImage.create(
        context: context,
        image: File(pickedFile.path),
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: _watermarkItem(),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: _logoFlutter(),
          )
        ],
        onSuccess: (file) => resultStamp(file),
      );
    }
  }

  ///Resetting an image file
  Future resetImage() async {
    setState(() {
      image = null;
    });
  }

  ///Handler when stamp image complete
  void resultStamp(File? file) {
    print(file?.path);
    setState(() {
      image = file;
    });
  }

  Widget _watermarkItem() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            DateTime.now().toString(),
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(height: 5),
          Text(
            "Made By Stamp Image",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoFlutter() {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: FlutterLogo(),
      ),
    );
  }

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
            _buttonTakePicture(),
            SizedBox(height: 10),
            _buttonCamera()
          ],
        ),
      ),
    );
  }

  Widget _buttonTakePicture() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () => takePicture(),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          "Take Picture",
          style: TextStyle(color: Colors.white, fontSize: 20),
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
      child: image != null ? Image.file(image!) : SizedBox(),
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