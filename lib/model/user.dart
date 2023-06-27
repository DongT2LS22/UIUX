
import 'package:ebook/model/schedule.dart';
import 'package:ebook/model/task.dart';

class User {
  String name;
  String email;
  String? address;
  String? phone;
  int? age;
  String? avatar;
  User(
  {required this.name, required this.email, this.address, this.phone, this.age,this.avatar});

  List<Task> getTask(){
    List<Task> listTask = [];
    schedules.forEach((schedule) {
      if(schedule.users!.contains(this) && schedule.tasks !=null){
        schedule.tasks!.forEach((task) {
          if(task.users!=null && task.users!.contains(this)){
            listTask.add(task);
          }
        });
      }
    });
    return listTask;
  }
}


List<User> users= [
  User(name: "Dong",email: "dongt2ls1720@gmail.com",address: "Nam Tu Liem ,Ha Noi",age: 21,avatar: "assets/elonmusk.png"),
  User(name: "Duc",email: "duc@gmail.com",address: "Cau Giay ,Ha Noi" ,age: 21),
  User(name: "Hieu beo",email: "hieu.tv@gmail.com",address: "Thuong Tin ,Ha Noi",age: 21),
  User(name: "Quang Anh",email: "vqa@gmail.com",address: "Thanh Xuan ,Ha Noi",age: 21),
  User(name: "Binh",email: "nktb@gmail.com",address: "Ha Noi",age: 21),
  User(name: "Ngoc Dung",email: "dung.nn@gmail.com",address: "Thanh Hoa",age: 21),
  User(name: "Son duc",email: "duc.ns@gmail.com",address: "Thanh Hoa",age: 21),
  User(name: "Quy",email: "quy.ld@gmail.com",address: "Thai Binh",age: 21),
];

List<User> userForTravel = [
  users[0],
  users[1],
  users[2],
  users[3],
  users[4],
  users[5],
  users[6],
  users[7]
];
List<User> userForPlaygame = [
  users[0],
  users[1],
  users[2],
  users[3],
  users[4],
  users[5],
  users[6],
  users[7]
];
List<User> userForStudy = [
  users[0],
  users[1],
  users[2],
  users[3],
  users[4],
  users[5],
  users[7]
];

List<User> userForUIUX = [
  users[0],
  users[1],
  users[2],
  users[3],
  users[4],
  users[5]
];

List<User> userForSoftware = [
  users[0],
  users[1],
  users[2],
  users[3],
  users[4],
  users[5],
  users[6],
  users[7]
];


List<User> testJoinCode = [
  users[1],
  users[2]
];