import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerClass extends StatefulWidget {
  ImagePickerClass(
    this.imagePickFn,
  );

  final void Function(File pickedImage) imagePickFn;

  @override
  _ImagePickerClassState createState() => _ImagePickerClassState();
}

class _ImagePickerClassState extends State<ImagePickerClass> {
  File _pickedImage;
  ImagePicker picker = ImagePicker();

  void _pickImage(ImageSource imageSource) async {
    final pickedImageFile = await picker.getImage(
      source: imageSource,
    );

    setState(() {
      _pickedImage = File(pickedImageFile.path);
    });
    widget.imagePickFn(File(pickedImageFile.path));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.orangeAccent.withOpacity(0.3),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: _pickedImage != null
                  ? Image(
                      image: FileImage(_pickedImage),
                    )
                  : Center(
                      child: Text("Please Add Image"),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton.icon(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text(
                      "Complete your action using..",
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                        ),
                      ),
                    ],
                    content: Container(
                      height: 120,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.camera),
                            title: Text(
                              "Camera",
                            ),
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                          Divider(
                            height: 1,
                            color: Colors.black,
                          ),
                          ListTile(
                            leading: Icon(Icons.image),
                            title: Text(
                              "Gallery",
                            ),
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          icon: Icon(Icons.add),
          label: Text(
            'Add Image',
          ),
        )
      ],
    );
  }
}