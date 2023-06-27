import 'package:ebook/model/user.dart';
import 'package:ebook/model/schedule.dart';

class Comment {
  String content;
  User person;
  Schedule schedule;

  Comment({required this.content,required this.person,required this.schedule});
}


List<Comment> comments = [
  Comment(content: "Hello world",person: schedules[0].users![0],schedule: schedules[1]),
  Comment(content: "Leo thach dau thoi nao !",person: schedules[0].users![1],schedule: schedules[1]),
  Comment(content: "8h leo thach dau nhe ! 8h leo thach dau nhe ! 8h leo thach dau nhe ! 8h leo thach dau nhe ! 8h leo thach dau nhe !",person: schedules[0].users![0],schedule: schedules[1]),
  Comment(content: "Hieu beo lam het roi nhe !",person: schedules[0].users![2],schedule: schedules[1]),
  Comment(content: "Leo thach dau thoi nao !",person: schedules[0].users![2],schedule: schedules[1]),
  Comment(content: "Toi nay ae len bar quay thoi !",person: schedules[0].users![0],schedule: schedules[0]),
  Comment(content: "Toi nay di cho dem nhe ae",person: schedules[0].users![2],schedule: schedules[0]),
  Comment(content: "Oke nhe !",person: schedules[0].users![2],schedule: schedules[0]),
  Comment(content: "Mai co lich di dau ko ae !",person: schedules[0].users![2],schedule: schedules[0]),
  Comment(content: "Khong co",person: schedules[0].users![2],schedule: schedules[0]),
];