
import 'package:ebook/constant.dart';
import 'package:ebook/model/task.dart';
import 'package:ebook/screen/personal_page/personal_page.dart';
import 'package:flutter/material.dart';

import '../../../../model/schedule.dart';
import '../../../../widget/card/scheduleCard.dart';
import '../../../schedule_page/schedulePage.dart';

class ListSchedule extends StatefulWidget {
  static String route = "listschedule";
  const ListSchedule({Key? key}) : super(key: key);

  @override
  State<ListSchedule> createState() => _ListScheduleState();
}

class _ListScheduleState extends State<ListSchedule> {
  _buildScheduleList(BuildContext context){
    List<Schedule> schedules = Schedule.getSchedule(userDefault);
    List<Widget> scheduleList = [];
    schedules.forEach((schedule) {
      scheduleList.add(ScheduleCard(schedule: schedule,callback: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SchedulePage(schedule: schedule,))).then((value) {
          setState(() {
          });
        });
      },));
      scheduleList.add(const SizedBox(height: 10,));
    });
    return scheduleList;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("My works",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black)),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PersonalPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      width: 360,
                      height: 50,
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
                              Container(
                                child:Text("Personal",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(personalSchedule.getScheduleRemain().toString(),style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Workspace",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                  SizedBox(height: 10,),
                  Column(
                    children: _buildScheduleList(context),
                  )
                  // Container(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: _buildScheduleList(),
                  //   ),
                  // )
                ],
              ),
            )
        ),
      ),
    );
  }
}
