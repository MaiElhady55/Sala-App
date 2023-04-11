import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
 final double margin;

  const MyDivider({super.key,this.margin=0.0});
  @override
  Widget build(BuildContext context) {
    return  Container(
  color:Color(0xFF8D8E98),
  width: double.infinity,
  height: 1,
  padding: EdgeInsets.all(16.0),
  margin: EdgeInsets.symmetric(horizontal: margin),
);;
  }
}