import 'package:flutter/material.dart';
import 'package:ml_with_chandigarh/widgets/appBar.dart';

class TensorflowLite extends StatelessWidget {
  final String title;

  const TensorflowLite({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: title),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            button(
              text: 'Text Recognition',
              onPressed: () {},
            ),
            button(
              text: 'Face Recognition',
              onPressed: () {},
            ),
            button(
              text: 'Object Recognition',
              onPressed: () {},
            ),
            button(
              text: 'Text Recognition',
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
