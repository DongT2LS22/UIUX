
import 'package:ebook/model/task.dart';
import 'package:ebook/model/user.dart';
import 'package:ebook/screen/task_page/taskDetailPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Noti {
  User owner;
  String date;
  String time;
  String title;
  String content;
  Widget link;
  List<User>? receiver;

  Noti({required this.owner,required this.date,required this.time,required this.title,required this.content,required this.link,
      this.receiver});
}


List<Noti> notis = [
  Noti(owner: tasksForPlayGame[1].owner,title: "Thay doi lich trinh ${tasksForPlayGame[1].title}",time: "11:00 AM",date: "23/6/2023",content: "Lich trinh ${tasksForPlayGame[1].title} da bi thay doi",link: TaskDetailPage(task: tasksForPlayGame[1] )),
  Noti(owner: tasksForPlayGame[2].owner,title: "Thay doi lich trinh ${tasksForPlayGame[2].title}",time: "11:00 AM",date: "23/6/2023",content: "Lich trinh ${tasksForPlayGame[2].title} da bi thay doi",link: TaskDetailPage(task: tasksForPlayGame[2] )),
  Noti(owner: tasksForPlayGame[3].owner,title: "Thay doi lich trinh ${tasksForPlayGame[3].title}",time: "11:00 AM",date: "23/6/2023",content: "Lich trinh ${tasksForPlayGame[3].title} da bi thay doi",link: TaskDetailPage(task: tasksForPlayGame[3] )),
  Noti(owner: tasksForTravel[1].owner,title: "Thay doi lich trinh ${tasksForTravel[1].title}",time: "11:00 AM",date: "23/6/2023",content: "Lich trinh ${tasksForTravel[1].title} da bi thay doi",link: TaskDetailPage(task: tasksForTravel[1])),
  Noti(owner: tasksForTravel[2].owner,title: "Thay doi lich trinh ${tasksForTravel[2].title}",time: "11:00 AM",date: "23/6/2023",content: "Lich trinh ${tasksForTravel[2].title} da bi thay doi",link: TaskDetailPage(task: tasksForTravel[2])),
];