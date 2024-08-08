import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Welcome to Flutter')),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text('Hello World'),
              Text('This app is made by Wooyoung'),
              Text('Good bye'),
            ]),
      ),
    ));
  }
}
