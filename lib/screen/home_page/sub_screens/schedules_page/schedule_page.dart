import 'package:flutter/material.dart';
import 'listSchedulePage.dart';

class ListSchedulePage extends StatelessWidget {
  const ListSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Schedule",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(),
      ),
      body: const ListSchedule(),
    );
  }
}
