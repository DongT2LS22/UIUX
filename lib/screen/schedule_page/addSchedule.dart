import 'package:ebook/constant.dart';
import 'package:ebook/model/schedule.dart';
import 'package:ebook/screen/schedule_page/create_list_member_page.dart';
import 'package:ebook/widget/field/inputField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/user.dart';

class AddSchedulePage extends StatefulWidget {
  static String route = 'addSchedule';

  const AddSchedulePage({Key? key}) : super(key: key);

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  List<User> userList = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDateStart = DateTime.now();
  DateTime _selectedDateEnd = DateTime.now();

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Add schedule",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              InputField(
                title: "Title",
                hint: "Enter your title",
                controller: _titleController,
              ),
              InputField(
                title: "Note",
                hint: "Enter your note",
                controller: _noteController,
              ),
              InputField(
                title: "Start date",
                hint: DateFormat.yMd().format(_selectedDateStart).toString(),
                widget: IconButton(
                  onPressed: () {
                    _getDateStartFromUser();
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              InputField(
                title: "End date",
                hint: DateFormat.yMd().format(_selectedDateEnd).toString(),
                widget: IconButton(
                  onPressed: () {
                    _getDateEndFromUser();
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Add member",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateListMemberPage(
                                        userList: userList))).then((value) {
                              setState(() {});
                            });
                          },
                          icon: Icon(
                            Icons.person_add_alt,
                            size: 25,
                          )),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Schedule schedule = Schedule(
                          title: _titleController.text,
                          code: _titleController.text,
                          note: _noteController.text,
                          owner: userDefault,
                          startDate: _selectedDateStart,
                          endDate: _selectedDateEnd,
                          users: [userDefault] + userList,
                          tasks: []);
                      setState(() {
                        schedules.add(schedule);
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
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
      ),
    );
  }

  _getDateStartFromUser() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: _selectedDateStart,
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
    if (pickerDate != null) {
      setState(() {
        _selectedDateStart = pickerDate;
      });
    }
  }

  _getDateEndFromUser() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: _selectedDateEnd,
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
    if (pickerDate != null) {
      setState(() {
        _selectedDateEnd = pickerDate;
      });
    }
  }
}
