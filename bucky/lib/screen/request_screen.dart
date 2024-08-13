import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bucky/const/colors.dart';

class RequestScreen extends StatelessWidget {
  //inal int number;
  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text(
      '의수족 신청',
      style: TextStyle(
        color: Colors.black,
      ),
    )));
  }
}
