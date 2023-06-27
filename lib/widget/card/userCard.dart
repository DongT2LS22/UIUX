import 'package:flutter/material.dart';

import '../../model/user.dart';
import '../avatar/avatar.dart';

class UserCard extends StatelessWidget {
  User user;
  Widget? last;
  UserCard({required this.user,this.last});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        padding: EdgeInsets.only(left: 10, top: 5, bottom: 7),
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Avatar(user: user,size: 32,),
                SizedBox(width: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name,style: TextStyle(
                        fontSize: 16,fontWeight: FontWeight.w600
                    ),),
                    Text(user.email,style: TextStyle(
                        fontSize: 13,fontWeight: FontWeight.w400
                    ),)
                  ],
                )
              ],
            ),
            last??Container()
          ],
        ),
      ),
    );
  }
}
