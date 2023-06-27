import 'package:ebook/model/task.dart';
import 'package:flutter/material.dart';

import '../../model/schedule.dart';
import 'package:d_chart/d_chart.dart';

class StatisticSchedulePage extends StatefulWidget {
  Schedule schedule;

  StatisticSchedulePage({Key? key, required this.schedule}) : super(key: key);

  @override
  State<StatisticSchedulePage> createState() => _StatisticSchedulePageState();
}

class _StatisticSchedulePageState extends State<StatisticSchedulePage> {
  @override
  Widget build(BuildContext context) {
    final data = [
      {
        'domain': 'In progress',
        'measure': (widget.schedule.tasks!
            .where((element) => element.status == Status.INPROGRESS)
            .length /
            widget.schedule.tasks!.length *
            100).toInt()
      },
      {
        'domain': 'To do',
        'measure': (widget.schedule.tasks!
            .where((element) => element.status == Status.TODO)
            .length /
            widget.schedule.tasks!.length *
            100).toInt()
      },
      {
        'domain': 'Completed',
        'measure': (widget.schedule.tasks!
            .where((element) => element.status == Status.COMPLETED)
            .length /
            widget.schedule.tasks!.length *
            100).toInt()
      },
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Statistic",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: widget.schedule.tasks != null
            ? SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 400,
                  child: DChartPie(
                    data: data,
                    fillColor: (data, index) {
                      switch (data['domain']) {
                        case 'In progress':
                          return Colors.red;
                        case 'To do':
                          return Colors.orange;
                        case 'Completed':
                          return Colors.green;
                        default:
                          return Colors.white;
                      }
                    },
                    labelColor: Colors.black,
                    donutWidth: 50,
                    labelFontSize: 13,
                    labelPosition: PieLabelPosition.inside,
                    pieLabel: (data, index) =>
                    data['measure'].toString() + '%',
                  )
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 30,
                          color: Colors.red,
                        ),
                        SizedBox(width: 20,),
                        Text("In progress",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 30,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 20,),
                        Text("To do",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 30,
                          color: Colors.green,
                        ),
                        SizedBox(width: 20,),
                        Text("Completed",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
            : Container(
          child: Center(
            child: Text("Schedule has 0 task"),
          ),
        ));
  }
}
