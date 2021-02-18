import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'mlkit/mlkit.dart';
import 'tensorflow_lite/tensorflow_lite.dart';
import 'widgets/appBar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'ML with Chandigarh';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ML with Chandigarh',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: title),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            circularButton(
              text: 'MLKit',
              heroTag: 'fab1',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => MLKit(
                          title: 'MLKit',
                        )));
              },
            ),
            SizedBox(
              height: 30,
            ),
            circularButton(
              text: 'Tensorflow lite',
              heroTag: 'fab2',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => TensorflowLite(
                          title: 'Tensorflow lite',
                        )));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget circularButton({Function() onPressed, String text, String heroTag}) {
    return SizedBox(
      height: 130,
      width: 130,
      child: FloatingActionButton(
        heroTag: heroTag,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
