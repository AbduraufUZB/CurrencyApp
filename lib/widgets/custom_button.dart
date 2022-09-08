import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Color color;
  String text;
  Color textColor;
  CustomButton({Key? key, required this.color, required this.text, required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 150,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Center(child: Text(text, style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),),),
    );
  }
}
