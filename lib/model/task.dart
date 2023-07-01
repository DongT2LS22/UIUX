import 'package:ebook/constant.dart';
import 'package:ebook/model/user.dart';

enum Status {
  TODO, INPROGRESS , COMPLETED
}

class Task {
  String title;
  String? note;
  DateTime date;
  String? startTime;
  String? endTime;
  User owner;
  int? remind;
  Status status;
  List<User>? users;
  Task({required this.title,required this.owner, this.note,required this.date, this.startTime, this.endTime,
      this.remind,this.users,this.status = Status.TODO});
}

List<Task> tasksForTravel = [
  Task(title: "Choi game",note: "Choi game xuyen dem",date: DateTime.utc(2023,6,22),startTime: "05:30 AM",endTime: "10:30 AM",remind: 10,users: users, owner: users[0],status: Status.INPROGRESS),
  Task(title: "Di uong nuoc",note: "Di uong nuoc voi ban be",date: DateTime.utc(2023,6,21),startTime: "10:30 AM",endTime: "11:30 AM",remind: 10,users: [users[0],users[1],users[2]],owner: users[0]),
  Task(title: "Di quay bar",note: "Di quay bar cung voi ae",date: DateTime.utc(2023,6,22),startTime: "10:30 AM",endTime: "11:30 AM",remind: 10,users: users,owner: users.last),
  Task(title: "Di bay lac",note: "Di bay lac voi ban be",date: DateTime.utc(2023,6,20),startTime: "10:30 AM",endTime: "11:30 AM",remind: 10,users: users,owner: users.last),
  Task(title: "Di mua quat",note: "Di mua quat voi ban be",date: DateTime.utc(2023,6,19),startTime: "10:30 PM",endTime: "11:30 PM",remind: 10,users: users,owner: users.last),
];

List<Task> tasksForPlayGame = [
  Task(title: "Choi game",note: "Leo thach dau",date: DateTime.utc(2023,6,21),startTime: "05:30 AM",endTime: "11:30 AM",users: users, owner: users.first,status: Status.COMPLETED),
  Task(title: "Choi game",note: "Leo thach dau",date: DateTime.utc(2023,6,11),startTime: "05:30 AM",endTime: "11:30 AM",users: users,owner: users.first,status : Status.COMPLETED),
  Task(title: "Choi game",note: "Leo thach dau",date: DateTime.utc(2023,7,12),startTime: "05:30 AM",endTime: "11:30 AM",users: users,owner: users.first , status: Status.COMPLETED),
  Task(title: "Choi game",note: "Leo thach dau",date: DateTime.utc(2023,6,18),startTime: "05:30 AM",endTime: "11:30 AM",users: users,owner: users.first , status: Status.COMPLETED),
  Task(title: "Choi game 1",note: "Leo thach dau",date: DateTime.utc(2023,7,9),startTime: "05:30 PM",endTime: "11:30 PM",users: users,owner: users.first , status: Status.COMPLETED),
];

List<Task> tasksForStudy = [
  Task(title: "Lam bai tap lon UIUX",note: "Hoan thanh bai tap lon UIUX",date: DateTime.utc(2023,7,20),startTime: "05:30 AM",endTime: "11:30 AM",users: [users[0],users[1],users[2]], owner: users.first,status: Status.COMPLETED),
  Task(title: "Lam bai tap lon ITSS",note: "Hoan thanh bai tap lon ITSS",date: DateTime.utc(2023,7,21),startTime: "05:30 AM",endTime: "11:30 AM",users: [users[1],users[2]], owner: users.first,status: Status.COMPLETED),
  Task(title: "On tap UIUX",note: "Tong on kien thuc UIUX buoi 1",date: DateTime.utc(2023,7,19),startTime: "10:30 AM",endTime: "11:30 AM",users: [users[0],users[1],users[2],users[4]], owner: users[2]),
  Task(title: "On tap UIUX",note: "Tong on kien thuc UIUX buoi 2",date: DateTime.utc(2023,6,16),startTime: "9:30 AM",endTime: "11:30 AM",users: [users[1],users[3],users[4]], owner: users[2]),
  Task(title: "Luyen tap UIUX",note: "Lam bai tap UIUX",date: DateTime.utc(2023,6,25),startTime: "2:30 PM",endTime: "5:30 PM",users: [users[0],users[1],users[3],users[4]], owner: userForStudy[0]),
  Task(title: "Bao ve bai tap lon UIUX",note: "Bao ve bai tap UIUX lop co giang",date: DateTime.utc(2023,6,27),startTime: "1:30 PM",endTime: "2:00 PM",users: [users[0],users[1],users[3],users[4]], owner: userForStudy[0]),
  Task(title: "Cham diem bai tap UIUX",note: "Cham bai tap UIUX cho nhom HI10",date: DateTime.utc(2023,6,27),startTime: "2:30 PM",endTime: "3:00 PM",users: [users[0],users[1],users[3],users[4]], owner: userForStudy[0]),
  Task(title: "Danh gia cac nhom UIUX",note: "Danh gia bai tap UIUX cho tat ca cac nhom",date: DateTime.utc(2023,6,27),startTime: "6:30 PM",endTime: "11:30 PM",users: [users[1],users[3],users[4]], owner: userForStudy[0]),
];

List<Task> tasksForUIUX = [
  Task(title: "Hop nhom UIUX", note: "abc",owner: users[4], date: DateTime.utc(2023,7,10),status: Status.COMPLETED,users: [users[0],users[1],users[2]],startTime: "10:30 AM",endTime: "11:30AM"),
  Task(title: "Hop nhom UIUX lan 2",note: "Neu ra phuong an thiet ke", owner: userForUIUX[1], date: DateTime.utc(2023,6,30),users: [users[0],users[1],users[3]],startTime: "10:30 AM",endTime: "11:30AM"),
  Task(title: "Sua thiet ke lan 1", note: "Thiet ke giao dien co ban",owner: userForUIUX[2], date: DateTime(2023,7,1),users: [users[0],users[2],users[3]],startTime: "9:00 PM",endTime: "10:30 PM"),
  Task(title: "Sua thiet ke lan 2", note: "Chinh sua, can doi bo cuc giao dien",owner: userForUIUX[0], date: DateTime(2023,7,4),users: [users[0],users[1],users[2],users[3]],startTime: "8:30 PM",endTime: "11:00 PM"),
  Task(title: "Sua thiet ke lan 3", note:"Hoan thanh bo cuc giao dien",owner: userForUIUX[2], date: DateTime(2023,7,6),users: [users[0],users[1],users[2],users[3]],startTime: "8:00 PM",endTime: "11:30 PM"),
  Task(title: "Tai lieu bao cao",note: "Hoan thanh tai lieu thiet ke", owner: users[4], date: DateTime(2023,7,9),users: [users[0],users[1],users[2],users[3],users[4]],startTime: "10:00 AM",endTime: "12:00 AM"),
  Task(title: "Bao cao",note: "Bao cao UIUX", owner: users[4], date: DateTime(2023,7,9),users: [users[0],users[1],users[2],users[3],users[4]],startTime: "6:45 AM",endTime: "9:00 AM"),
];

List<Task> tasksForSoftware = [
  Task(title: "Lam quen thanh vien",owner: users[3], date: DateTime.utc(2023,6,2),status: Status.COMPLETED,users: [users[0],users[1],users[2],users[4],users[5],users[6],users[7]],startTime: "10:30 AM",endTime: "11:30AM"),
  Task(title: "Trien khai bai tap lon",note: "Thong nhat phuong an trien khai btl", owner: userForSoftware[5], date: DateTime.utc(2023,6,11),status: Status.COMPLETED,users: [users[1],users[3]],startTime: "10:30 AM",endTime: "11:30AM"),
  Task(title: "Coding", note: "Cai dat chuong tirnh btl",owner: userForSoftware[5],status: Status.INPROGRESS, date: DateTime(2023,6,25),users: [users[2],users[3],users[7]],startTime: "8:00 PM",endTime: "11:30 PM"),
  Task(title: "Coding lan 2", note: "Xay dung giao dien",owner: userForSoftware[6],status: Status.INPROGRESS, date: DateTime(2023,6,27),users: [users[1],users[2],users[3]],startTime: "8:30 PM",endTime: "11:00 PM"),
  Task(title: "Coding lan 3", note:"Kiem thu phan mem",owner: userForSoftware[6], date: DateTime(2023,7,2),users: [users[1],users[2],users[3],users[7]],startTime: "8:00 PM",endTime: "11:30 PM"),
  Task(title: "Tai lieu",note: "Hoan thanh bao cao", owner: users[3], date: DateTime(2023,7,2),users: [users[1],users[2],users[4],users[5],users[6],users[7]],startTime: "10:00 AM",endTime: "12:00 AM"),
  Task(title: "Coding lan 4",note: "Xay dung backend", owner: users[3], date: DateTime(2023,7,5),users: [users[0],users[1],users[2],users[4],users[5],users[6],users[7]],startTime: "10:00 AM",endTime: "12:00 AM"),
  Task(title: "Lam tai lieu",note: "Kiem tra lai bao cao", owner: users[3], date: DateTime(2023,7,4),users: [users[0],users[1],users[2],users[4],users[5],users[6],users[7]],startTime: "10:00 AM",endTime: "12:00 AM"),
];

List<Task> tasksForPersonal = [
  Task(title: "Lam bai tap lon UIUX", owner: userDefault, date: DateTime.utc(2023,6,23),note: "Tap trung lam not bai tap lon UIUX de con lam bai khac ...",startTime: "9:30AM",endTime: "10:30AM",users: [userDefault]),
  Task(title: "Lam bai tap lon ITSS", owner: userDefault, date: DateTime.utc(2023,6,24),startTime: "9:30AM",endTime: "10:30AM",users: [userDefault]),
  Task(title: "Lam bai tap lon KTPM", owner: userDefault, date: DateTime.utc(2023,6,25),startTime: "9:30AM",endTime: "10:30AM",users: [userDefault]),
  Task(title: "Choi game xuyen dem", owner: userDefault, date: DateTime.utc(2023,6,26),startTime: "9:30AM",endTime: "10:30AM",users: [userDefault]),
];

List<Task> testJoinCodeTask = [
  Task(title: "Test san pham", owner: users[1], date: DateTime.utc(2023,6,27),note: "Test",startTime: "9:30AM",endTime: "10:30AM",users: [users[1]]),
];

List<Task> allTask = tasksForTravel + tasksForStudy +tasksForPlayGame + tasksForUIUX + tasksForSoftware + testJoinCodeTask;