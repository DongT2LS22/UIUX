import 'package:ebook/constant.dart';
import 'package:ebook/model/schedule.dart';
import 'package:ebook/model/task.dart';
import 'package:ebook/widget/avatar/task_card.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  List<Task> tasks;
  Calendar({Key? key,required this.tasks}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

extension MyDateExtension on DateTime {
  DateTime getDateOnly(){
    return DateTime(this.year, this.month, this.day);
  }
}

class _CalendarState extends State<Calendar> {

  CalendarFormat _format = CalendarFormat.week;
  DateTime selectedDay = DateTime.utc(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  DateTime focusedDay = DateTime.now();

  List<Task> _getTasksFromDay(DateTime time) {
    List<Task> tasksToday = [];
    for (var task in widget.tasks) {
      if (task.date.getDateOnly() == time.getDateOnly()) {
        tasksToday.add(task);
      }
    }
    for(var task in tasksForPersonal) {
      if (task.date.getDateOnly() == time.getDateOnly()) {
        tasksToday.add(task);
      }
    }
    return tasksToday;
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          currentDay: DateTime.now(),
          pageJumpingEnabled: true,
          focusedDay: focusedDay,
          rowHeight: 60,
          firstDay: DateTime.utc(2020),
          lastDay: DateTime.utc(2025),
          calendarFormat: _format,
          onFormatChanged: (CalendarFormat format) {
            setState(() {
              _format = format;
            });
          },
          eventLoader: _getTasksFromDay,
          onDaySelected: (DateTime selectDay, DateTime focusDay) {
            setState(() {
              selectedDay = selectDay;
              focusedDay = focusDay;
            });
          },
          selectedDayPredicate: (DateTime date) {
            return isSameDay(selectedDay, date);
          },
          availableCalendarFormats: const {
            CalendarFormat.week: 'Week',
            CalendarFormat.month: 'Month'
          },
          headerStyle: HeaderStyle(
            titleTextStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            titleCentered: true,
            formatButtonVisible: true,
            formatButtonShowsNext: false,
            formatButtonDecoration: BoxDecoration(
              color: Color.lerp(const Color.fromARGB(255, 59, 117, 245),
                  const Color.fromARGB(255, 76, 142, 246), 1),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            formatButtonTextStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          calendarStyle: CalendarStyle(
              markersMaxCount: 1,
              todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.lerp(const Color.fromARGB(255, 59, 117, 245),
                      const Color.fromARGB(255, 76, 142, 246), 1)),
              selectedDecoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blueAccent)),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: _getTasksFromDay(selectedDay).map((Task task) => TaskCard(
              task: task,
              schedule: tasksForPersonal.contains(task) ? "Personal" : schedules
                  .firstWhere((schedule) => schedule.tasks!.contains(task))
                  .title,
              bgColor: Color.lerp(const Color.fromARGB(255, 59, 117, 245),
                  const Color.fromARGB(255, 76, 142, 246), 1)!)).toList(),
        )
      ],
    );
  }
}
