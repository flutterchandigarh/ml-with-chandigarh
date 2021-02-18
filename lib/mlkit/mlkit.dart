import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ml_with_chandigarh/widgets/appBar.dart';
import 'package:ml_with_chandigarh/image_picker_class.dart';

class MLKit extends StatefulWidget {
  final String title;

  const MLKit({Key key, this.title}) : super(key: key);

  @override
  _MLKitState createState() => _MLKitState();
}

class _MLKitState extends State<MLKit> {
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
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
            button(
              text: 'Text Recognition',
              onPressed: () {},
            ),
            button(
              text: 'Image Labelling',
              onPressed: () {},
            ),
            button(
              text: 'Face Detection',
              onPressed: () {},
            ),
            button(
              text: 'Barcode Scanning',
              onPressed: () {},
            ),
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
