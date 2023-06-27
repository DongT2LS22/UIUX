import 'package:flutter/material.dart';

import '../../model/user.dart';

class Avatar extends StatelessWidget {
  User user;
  double size;
  Avatar({Key? key,required this.user,this.size = 25}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user.avatar == null ?
    Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.grey),
          color: Colors.white
      ),
      child: Icon(Icons.person,color: Colors.black,size: size-6,),
    ) :
    Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.grey),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(user.avatar!,fit: BoxFit.cover,),
      ),
    );
  }
}
