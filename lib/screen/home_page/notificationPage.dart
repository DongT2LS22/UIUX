import 'package:ebook/widget/card/notificationCard.dart';
import 'package:flutter/material.dart';

import '../../model/notification.dart';

class NotificationPage extends StatelessWidget {
  static String route = 'notifications';

  const NotificationPage({Key? key}) : super(key: key);

  _buildNotiList() {
    List<Widget> notiCard = [];
    notis.forEach((element) {
      notiCard.add(NotificationCard(noti: element));
    });
    notiCard.add(SizedBox(height: 10,));
    return notiCard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: _buildNotiList(),
        ),
      )),
    );
  }
}
