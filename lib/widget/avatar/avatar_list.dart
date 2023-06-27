
import 'package:flutter/material.dart';

import '../../model/user.dart';
import 'avatar.dart';


class AvatarList extends StatelessWidget {
  double size;
  List<User> users;
  AvatarList({Key? key,required this.users,this.size = 25}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: size*3,
          height: size + 8,
        ),
        users.length>=1 ? Avatar(user: users[0],size: size,) : Container(),
        users.length >= 2 ? Positioned(
          left: size/2,
          child: Avatar(
            user: users[1],
            size: size,
          ),
        ) : Container(),
        users.length >= 3 ? Positioned(
          left: size ,
          child: Avatar(user: users[2],size: size,),
        ) : Container(),
        users.length > 3 ?
        Positioned(left: size*3/2 ,child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50)
          ),
          child: Center(
            child: Text("+${users.length - 3}",style: const TextStyle(fontSize: 13,color: Colors.blue),),
          ),
        ),) : Container()
      ],
    );
  }
}
