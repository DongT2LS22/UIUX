import 'package:ebook/constant.dart';
import 'package:ebook/screen/home_page/sub_screens/calendar_page/calendar_appbar.dart';
import 'package:flutter/material.dart';

import 'calendar.dart';
class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Calendar(tasks: userDefault.getTask(),),
            ),
          ],
        ),
      ),
    );
  }
}
