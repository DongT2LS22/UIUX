import 'package:ebook/constant.dart';
import 'package:ebook/model/user.dart';
import 'package:ebook/model/task.dart';

class Schedule {
  User owner;
  String? code;
  String title;
  String? note;
  DateTime? startDate;
  DateTime? endDate;
  List<User>? users;
  List<Task>? tasks;
  List<User>? assistants;

  Schedule(
      {required this.title,
      this.code,
      required this.owner,
      this.note,
      this.startDate,
      this.endDate,
      this.tasks,
      this.users,
      this.assistants});

  double getProgress() {
    int completedTask = 0;
    int length = tasks!.length;
    tasks!.forEach((task) {
      task.status == Status.COMPLETED ? ++completedTask : null;
    });
    return completedTask / length;
  }

  static List<Schedule> getSchedule(User user) {
    List<Schedule> scheduleList = [];

    schedules.forEach((schedule) {
      if (schedule.users != null) {
        if (schedule.users!.contains(user)) {
          scheduleList.add(schedule);
        }
      }
    });
    return scheduleList;
  }

  static List<Schedule> getScheduleForAdmin (User user){
    List<Schedule> scheduleList = [];

    schedules.forEach((schedule) {
      if (schedule.users != null) {
        if (schedule.assistants!.contains(user) || schedule.owner == user) {
          scheduleList.add(schedule);
        }
      }
    });
    return scheduleList;
  }
  int getScheduleRemain() {
    int total = 0;
    if (this.tasks == null) return 0;
    this.tasks!.forEach((task) {
      (task.status != Status.COMPLETED &&
              task.users != null &&
              task.users!.contains(userDefault))
          ? total++
          : null;
    });
    return total;
  }
}

Schedule personalSchedule = Schedule(title: "Personal", owner: userDefault,tasks: tasksForPersonal);

List<Schedule> schedules = [
  Schedule(
      owner: users[0],
      code: "123",
      title: "Travel",
      note: "Let's go",
      startDate: DateTime.utc(2023, 6, 6),
      endDate: DateTime.utc(2023, 6, 9),
      tasks: tasksForTravel,
      users: userForTravel,
      assistants: [userForTravel[0], userForTravel[1], userForTravel[2]]),
  Schedule(
      owner: users[1],
      code: "234",
      title: "Play game",
      note: "Road to master",
      startDate: DateTime.utc(2023, 6, 1),
      endDate: DateTime.utc(2023, 7, 1),
      tasks: tasksForPlayGame,
      users: userForPlaygame,
      assistants: [userForPlaygame[0], userForPlaygame[1]]),
  Schedule(
      owner: users[2],
      code: "Hello",
      title: "Study for final exam",
      note: "Try hard for 4.0",
      startDate: DateTime.utc(2023, 5, 1),
      endDate: DateTime.utc(2023, 9, 1),
      tasks: tasksForStudy,
      users: userForStudy,
      assistants: [userForStudy[0], userForStudy[1]]),
  Schedule(
      owner: users[4],
      code: "345",
      title: "UIUX",
      note: "Try hard !",
      startDate: DateTime.utc(2023, 4, 1),
      endDate: DateTime.utc(2023, 10, 1),
      tasks: tasksForUIUX,
      users: userForUIUX,
      assistants: [userForUIUX[0], userForUIUX[1], userForUIUX[2]]),
  Schedule(
      owner: users[3],
      code: "12345678",
      title: "Software",
      note: "Try hard lay diem cao!",
      startDate: DateTime.utc(2023, 6, 1),
      endDate: DateTime.utc(2023, 8, 1),
      tasks: tasksForSoftware,
      users: userForSoftware,
      assistants: [userForSoftware[5], userForSoftware[6]]),
  Schedule(
      owner: users[1],
      code: "abc",
      title: "Test join code",
      note: "Try hard lay diem cao!",
      startDate: DateTime.utc(2023, 6, 20),
      endDate: DateTime.utc(2023, 8, 20),
      tasks: testJoinCodeTask,
      users: testJoinCode,
      assistants: [users[1]]
  )
];

