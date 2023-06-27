
import 'package:ebook/model/user.dart';
import 'package:ebook/model/task.dart';

import 'fileAttach.dart';

class Assignment {
  User person;
  Task task;
  String? note;
  List<FileAttach>? files;
  int? mark;
  Assignment({required this.person,required this.task, this.note,this.files,this.mark});
}


List<Assignment> assignments = [
  Assignment(person: allTask[0].users![0], task: allTask[0] , files: files1,note: "Lich su dau hom nay"),
  Assignment(person: allTask[0].users![1], task: allTask[0] , files: files2),
  Assignment(person: allTask[2].users![0], task: allTask[3] , files: files3),
  Assignment(person: allTask[3].users![0], task: allTask[1] , files: files3),
  Assignment(person: allTask[2].users![0], task: allTask[2] , files: files3),
];