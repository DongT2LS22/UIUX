import 'package:ebook/constant.dart';
import 'package:ebook/model/schedule.dart';
import 'package:ebook/model/task.dart';
import 'package:ebook/screen/home_page/sub_screens/calendar_page/calendar.dart';
import 'package:ebook/screen/task_page/create_list_member_page.dart';
import 'package:ebook/widget/field/inputField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/user.dart';

class AddTaskPage extends StatefulWidget {
  String? scheduleName;
  static String route = 'addtask';

  AddTaskPage({Key? key, this.scheduleName}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  List<User> userList = [];
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = "09:30 AM";
  int _selectedRemind = 5;
  late String _selectedSchedule;
  List<int> remindList = [5, 10, 15, 20];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedSchedule =
        widget.scheduleName == null ? "Personal" : widget.scheduleName!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Add task",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                InputField(
                  title: "Schedule",
                  hint: _selectedSchedule,
                  widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    items: (Schedule.getScheduleForAdmin(userDefault) +
                            [personalSchedule])
                        .map<DropdownMenuItem<String>>((schedule) {
                      return DropdownMenuItem<String>(
                        value: schedule.title,
                        child: Text(schedule.title),
                      );
                    }).toList(),
                    iconSize: 32,
                    underline: Container(
                      height: 0,
                    ),
                    elevation: 4,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedSchedule = value!;
                      });
                    },
                  ),
                ),
                InputField(
                  title: "Title",
                  hint: "Enter your title",
                  controller: _titleController,
                ),
                InputField(
                  title: "Note",
                  hint: "Enter yout note",
                  controller: _noteController,
                ),
                InputField(
                  title: "Date",
                  hint: DateFormat.yMd().format(_selectedDate).toString(),
                  widget: IconButton(
                    onPressed: () {
                      _getDateFromUser();
                    },
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: InputField(
                      title: "Start time",
                      hint: _startTime,
                      widget: IconButton(
                        icon: const Icon(Icons.access_time_rounded),
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                      ),
                    )),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: InputField(
                      title: "End time",
                      hint: _endTime,
                      widget: IconButton(
                        icon: const Icon(Icons.access_time_rounded),
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                      ),
                    )),
                  ],
                ),
                InputField(
                  title: "Remind",
                  hint: "$_selectedRemind minutes early",
                  widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    items:
                        remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    iconSize: 32,
                    underline: Container(
                      height: 0,
                    ),
                    elevation: 4,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRemind = int.parse(value!);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _selectedSchedule == "Personal" ? Container() : Row(
                      children: [
                        Text("Add member",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        SizedBox(width: 5,),
                        IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateListMemberPage(schedule: schedules.firstWhere((element) => element.title == _selectedSchedule), userList: userList))).then((value){setState(() {

                              });});
                            },
                            icon: Icon(Icons.person_add_alt,size: 25,)
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Task task = Task(
                            title: _titleController.text,
                            note: _noteController.text,
                            owner: userDefault,
                            date: _selectedDate.getDateOnly(),
                            startTime: _startTime,
                            endTime: _endTime,
                            remind: _selectedRemind,
                            users: userList + [userDefault]);
                        if (_selectedSchedule == "Personal") {
                          personalSchedule.tasks!.add(task);
                        } else {
                          var schedule = schedules.firstWhere((schedule) {
                            return schedule.title == _selectedSchedule;
                          });
                          schedule.tasks!.add(task);
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Create",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formatedTime;
      });
    } else {
      setState(() {
        _endTime = formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}
