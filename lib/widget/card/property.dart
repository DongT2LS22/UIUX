import 'package:flutter/material.dart';

class Property extends StatelessWidget {
  IconData icon;
  String title;
  Widget widget;

  Property({required this.icon,required this.title,required this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 25,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 30,
        ),
        widget
      ],
    );
  }
}
