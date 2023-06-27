import 'package:ebook/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';
import '../../model/task.dart';
import '../task_page/taskDetailPage.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  _buildTaskCard(Task task) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => TaskDetailPage(task: task,),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black),
                ),
                GestureDetector(
                  child: task.status == Status.COMPLETED
                      ? Container(
                          width: 27,
                          height: 27,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: cardColor),
                          child: const Icon(
                            Icons.check,
                            size: 20,
                          ),
                        )
                      : Container(
                          width: 27,
                          height: 27,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all()),
                        ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "${task.startTime!} - ${task.endTime}",
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  DateFormat.yMMMd().format(task.date),
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              task.note == null ? "" : task.note!,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  _buildListTask() {
    List<Widget> listTask = [Container()];
    if (personalSchedule.tasks == null) {
      return listTask;
    }
    for (var task in personalSchedule.tasks!) {
      task.status != Status.COMPLETED
          ? listTask.add(_buildTaskCard(task))
          : Container();
    }
    for (var task in personalSchedule.tasks!) {
      task.status == Status.COMPLETED
          ? listTask.add(_buildTaskCard(task))
          : Container();
    }
    return listTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: _buildListTask(),
          ),
        ),
      ),
    );
  }
}
