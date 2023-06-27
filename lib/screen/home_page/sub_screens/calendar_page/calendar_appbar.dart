import 'package:flutter/material.dart';
class CalendarAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CalendarAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        "Calendar",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Container(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
