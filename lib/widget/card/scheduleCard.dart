
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../model/schedule.dart';
import '../../screen/schedule_page/schedulePage.dart';

class ScheduleCard extends StatefulWidget {
  Schedule schedule;
  bool star;
  Function() callback;
  ScheduleCard({Key? key,required this.schedule,this.star = true,required this.callback}) : super(key: key);

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Container(
        padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 20),
        height: 50,
        width: 360,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      widget.star = !widget.star;
                    });
                  },
                  child: widget.star == true ? Icon(Icons.star,color: Colors.yellow,size: 30,): Icon(Icons.star_border_purple500_sharp,color: Colors.white,size: 30,),
                ),
                SizedBox(width: 10,),
                Container(
                  child:Text("${widget.schedule.title}",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text("${widget.schedule.getScheduleRemain()}",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
