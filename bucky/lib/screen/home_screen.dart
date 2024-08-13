import 'package:flutter/cupertino.dart';
import 'package:bucky/const/colors.dart';

class HomeScreen extends StatelessWidget {
  final int number;
  const HomeScreen({required this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: 32.0),
      Text('홈',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          )),
    ]);
  }
}
