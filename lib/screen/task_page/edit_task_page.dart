
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constant.dart';
import '../../model/schedule.dart';
import '../../model/task.dart';
import '../../model/user.dart';
import '../../widget/field/inputField.dart';

class EditTaskPage extends StatefulWidget {
  Task task;
  EditTaskPage({Key? key,required this.task}) : super(key: key);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
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
    personalSchedule.tasks!.contains(widget.task)? "Personal" : schedules.firstWhere((schedule) =>schedule.tasks!.contains(widget.task)).title;
    _titleController.text = widget.task.title;
    _noteController.text = widget.task.note??"";
    _selectedDate = widget.task.date;
    _startTime = widget.task.startTime!;
    _endTime = widget.task.endTime!;
    _selectedRemind = widget.task.remind??5;
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
                  "Edit task",
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
                   Container(),
                    GestureDetector(
                      onTap: () {
                        widget.task.title = _titleController.text;
                        widget.task.note =_noteController.text;
                        widget.task.date = _selectedDate;
                        widget.task.startTime = _startTime;
                        widget.task.endTime = _endTime;
                        widget.task.remind = _selectedRemind;
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
                            "Edit",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
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
