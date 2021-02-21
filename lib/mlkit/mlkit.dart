import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:ml_with_chandigarh/widgets/appBar.dart';
import 'package:ml_with_chandigarh/widgets/image_picker_class.dart';

class MLKit extends StatefulWidget {
  final String title;

  const MLKit({Key key, this.title}) : super(key: key);

  @override
  _MLKitState createState() => _MLKitState();
}

class _MLKitState extends State<MLKit> {
  File _userImageFile;
  List<ImageLabel> _imageLabels = [];
  List<Barcode> _barCode = [];
  List<Face> _face = [];
  var result = "";

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  imageLabelling() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_userImageFile);
    ImageLabeler labeler = FirebaseVision.instance.imageLabeler();
    _imageLabels = await labeler.processImage(myImage);
    result = "";
    for (ImageLabel imageLabel in _imageLabels) {
      setState(() {
        result = result +
            imageLabel.text +
            ":" +
            imageLabel.confidence.toString() +
            "\n";
      });
    }
    print("RESULT: $result");
    labeler.close();
  }

  textRecognition() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_userImageFile);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(myImage);
    result = "";
    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        setState(() {
          result = result + ' ' + line.text + '\n';
        });
      }
    }
    print("RESULT: $result");
    recognizeText.close();
  }

  barcodeScanner() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_userImageFile);
    BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
    _barCode = await barcodeDetector.detectInImage(myImage);
    result = "";
    for (Barcode barcode in _barCode) {
      setState(() {
        result = barcode.displayValue;
      });
    }
    print("RESULT: $result");
    barcodeDetector.close();
  }

  faceDetection() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_userImageFile);
    FaceDetector faceDetector = FirebaseVision.instance.faceDetector();
    _face = await faceDetector.processImage(myImage);
    result = "";
    for (Face face in _face) {
      setState(() {
        result = face.boundingBox.toString() +
            face.headEulerAngleY.toString() +
            face.headEulerAngleZ.toString();
      });
    }
    print("RESULT: $result");
    faceDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: widget.title),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImagePickerClass(_pickedImage),
            SizedBox(
              height: 30,
            ),
            button(
              text: 'Text Recognition',
              onPressed: () {
                result = "";
                setState(() {});
                textRecognition();
              },
            ),
            button(
              text: 'Image Labelling',
              onPressed: () {
                result = "";
                setState(() {});
                imageLabelling();
              },
            ),
            button(
                text: 'Face Detection',
                onPressed: () {
                  result = "";
                  setState(() {});
                  faceDetection();
                }),
            button(
                text: 'Barcode Scanning',
                onPressed: () {
                  result = "";
                  setState(() {});
                  barcodeScanner();
                }),
            SizedBox(
              height: 30,
            ),
            Text(
              'Result: $result',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  Widget button({Function() onPressed, String text}) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
