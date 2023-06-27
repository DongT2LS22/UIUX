import 'package:ebook/constant.dart';
import 'package:ebook/screen/home_page/sub_screens/calendar_page/calendar_page.dart';
import 'package:ebook/screen/home_page/sub_screens/profile_page/profile_page.dart';
import 'package:ebook/screen/home_page/sub_screens/schedules_page/schedule_page.dart';
import 'package:ebook/screen/home_page/notificationPage.dart';
import 'package:ebook/screen/home_page/sub_screens/search_page/searchPage.dart';
import 'package:ebook/screen/schedule_page/addSchedule.dart';
import 'package:ebook/screen/task_page/addTaskPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import '../../model/schedule.dart';
import '../../model/task.dart';
import '../../widget/avatar/task_card.dart';

class HomePage extends StatefulWidget {
  static String route = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  var rmicons = false;
  var isDialOpen = ValueNotifier<bool>(true);
  var speedDialDirection = SpeedDialDirection.up;
  TextEditingController controller = TextEditingController();

  //homepage
  _buildTodayTask() {
    List<Widget> tasks = [];
    userDefault.getTask().forEach((task) {
      if (DateFormat.yMd().format(task.date) ==
              DateFormat.yMd().format(DateTime.now()) &&
          task.users!.contains(userDefault)) {
        tasks.add(TaskCard(
            task: task,
            schedule: schedules
                .firstWhere((schedule) => schedule.tasks!.contains(task))
                .title,
            bgColor: Color.lerp(Color.fromARGB(255, 59, 117, 245),
                Color.fromARGB(255, 76, 142, 246), 1)!));
      }
    });
    tasksForPersonal.forEach((task) {
      if (DateFormat.yMd().format(task.date) ==
          DateFormat.yMd().format(DateTime.now()) &&
          task.users!.contains(userDefault)) {
        tasks.add(TaskCard(
            task: task,
            schedule: "Personal",
            bgColor: Color.lerp(Color.fromARGB(255, 59, 117, 245),
                Color.fromARGB(255, 76, 142, 246), 1)!));
      }
    });
    return tasks;
  }

  _buildHomePageBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's tasks",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: _buildTodayTask()),
          )
        ],
      ),
    );
  }

  _buildAppBarHomePage() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 0,
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
              image: AssetImage("assets/elonmusk.png"),
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, ${userDefault.name} !",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "How are you feeling today ?",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationPage.route);
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30,
            )),
      ],
    );
  }

  _buildProfilePageBody() {
    return ProfilePage();
  }

  _buildCalendarPageBody() {
    return CalendarPage();
  }

  _buildSearchPage() {
    return SearchPage();
  }

  _buildSchedulePage() {
    return ListSchedulePage();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: selectedIndex == 0 ? _buildAppBarHomePage() : null,
      body: selectedIndex == 0
          ? _buildHomePageBody()
          : selectedIndex == 1
              ? _buildSchedulePage()
              : selectedIndex == 2
                  ? _buildCalendarPageBody()
                  : selectedIndex == 3
                      ? _buildSearchPage()
                      : _buildProfilePageBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        selectedIconTheme: IconThemeData(size: 27, opticalSize: 1),
        unselectedIconTheme: IconThemeData(opticalSize: 1, size: 27),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Project"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
              ),
              label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Personal"),
        ],
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.black,
        spacing: 10,
        icon: Icons.add,
        activeIcon: Icons.close,
        openCloseDial: isDialOpen,
        elevation: 8.0,
        direction: speedDialDirection,
        children: [
          SpeedDialChild(
            child: !rmicons ? Icon(Icons.task) : null,
            backgroundColor: Color.lerp(const Color.fromARGB(255, 59, 117, 245),
                const Color.fromARGB(255, 76, 142, 246), 1),
            foregroundColor: Colors.white,
            label: 'Add task',
            onTap: ()=>Navigator.pushNamed(context, AddTaskPage.route).then((value){setState(() {

            });})
          ),
          SpeedDialChild(
            child: !rmicons ? const Icon(Icons.margin_outlined) : null,
            backgroundColor: Color.lerp(const Color.fromARGB(255, 59, 117, 245),
                const Color.fromARGB(255, 76, 142, 246), 1),
            foregroundColor: Colors.white,
            label: 'Add schedule',
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSchedulePage())).then((value){
              setState(() {
              });
            })
          ),
          SpeedDialChild(
              child: !rmicons ? const Icon(Icons.code) : null,
              backgroundColor: Color.lerp(
                  const Color.fromARGB(255, 59, 117, 245),
                  const Color.fromARGB(255, 76, 142, 246),
                  1),
              foregroundColor: Colors.white,
              label: 'Join schedule with code',
              visible: true,
              onTap: () =>
                  showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        insetPadding: EdgeInsets.all(0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 14),
                                height: 40,
                                width: 200,
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: TextFormField(
                                      controller: controller,
                                      readOnly: false,
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                      decoration: const InputDecoration(
                                          hintText: "Enter code",
                                          hintStyle: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 0)),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 0))),
                                    )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      schedules.firstWhere((schedule) => schedule.code == controller.text).users!.add(userDefault);
                                    });
                                    Navigator.of(context).pop();
                                    controller.clear();
                                  },
                                  child: const Text(
                                    "Join",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ],
                          ),
                        ),
                      ))),
        ],
      ),
    );
  }
}
