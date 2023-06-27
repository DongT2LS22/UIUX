import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/schedule.dart';
import '../../widget/field/inputField.dart';


class EditSchedulePage extends StatefulWidget {
  Schedule schedule;
  EditSchedulePage({Key? key,required this.schedule}) : super(key: key);

  @override
  State<EditSchedulePage> createState() => _EditSchedulePageState();
}

class _EditSchedulePageState extends State<EditSchedulePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  late DateTime _selectedDateForStartDate;
  late DateTime _selectedDateForEndDate;
  _getDateFromUserForStart() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: _selectedDateForStartDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
    if (pickerDate != null) {
      setState(() {
        _selectedDateForStartDate = pickerDate;
      });
    }
  }
  _getDateFromUserForEnd() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: _selectedDateForEndDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
    if (pickerDate != null) {
      setState(() {
        _selectedDateForEndDate = pickerDate;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDateForStartDate = widget.schedule.startDate!;
    _selectedDateForEndDate = widget.schedule.endDate!;
    _titleController.text = widget.schedule.title;
    _noteController.text = widget.schedule.note!;
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Edit schedule",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              InputField(title: "Title", hint: "Enter your title",controller: _titleController,),
              InputField(title: "Note", hint: "Enter your note",controller: _noteController,),
              InputField(
                title: "Start date",
                hint: DateFormat.yMd().format(_selectedDateForStartDate).toString(),
                widget: IconButton(
                  onPressed: () {
                    _getDateFromUserForStart();
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              InputField(
                title: "End date",
                hint: DateFormat.yMd().format(_selectedDateForEndDate).toString(),
                widget: IconButton(
                  onPressed: () {
                    _getDateFromUserForEnd();
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
                  Container(),
                  GestureDetector(
                    onTap: () {
                      widget.schedule.title = _titleController.text;
                      widget.schedule.note = _noteController.text;
                      widget.schedule.startDate = _selectedDateForStartDate;
                      widget.schedule.endDate = _selectedDateForEndDate;
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Center(
                        child: Text("Edit", style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),),
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
}
