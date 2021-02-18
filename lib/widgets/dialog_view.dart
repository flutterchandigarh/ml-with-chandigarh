import 'package:flutter/material.dart';

class DialogView extends StatefulWidget {
  final String result;
  final String title;

  const DialogView({Key key, this.result, this.title}) : super(key: key);
  @override
  _DialogViewState createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          widget.result == ""
              ? CircularProgressIndicator()
              : Text(widget.result),
        ],
      ),
    );
  }
}
