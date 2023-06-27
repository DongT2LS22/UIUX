import 'dart:core';
import 'package:ebook/model/comment.dart';

import 'package:ebook/constant.dart';
import 'package:ebook/screen/schedule_page/addMemberSchedulePage.dart';
import 'package:ebook/screen/schedule_page/edit_schedule_page.dart';
import 'package:ebook/screen/schedule_page/statistic_schedule_page.dart';
import 'package:ebook/screen/task_page/addTaskPage.dart';
import 'package:ebook/screen/task_page/taskDetailPage.dart';
import 'package:ebook/widget/card/property.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/schedule.dart';
import '../../model/task.dart';
import '../../widget/card/userCard.dart';

class SchedulePage extends StatefulWidget {
  Schedule schedule;

  SchedulePage({required this.schedule});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int? _indexSelected;
  bool _isNoti = true;
  TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _indexSelected = 0;
  }

  _buildTaskCard(Task task) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TaskDetailPage(task: task)))
            .then((value) {
          setState(() {});
        });
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
    if (widget.schedule.tasks == null) {
      return listTask;
    }
    for (var task in widget.schedule.tasks!) {
      task.status != Status.COMPLETED
          ? listTask.add(_buildTaskCard(task))
          : Container();
    }
    for (var task in widget.schedule.tasks!) {
      task.status == Status.COMPLETED
          ? listTask.add(_buildTaskCard(task))
          : Container();
    }
    return listTask;
  }

  _buildListMember() {
    List<Widget> userList = [];
    widget.schedule.users!.forEach((user) {
      userList.add(UserCard(
        user: user,
        last: userDefault == widget.schedule.owner && user != userDefault
            ? IconButton(
                onPressed: () async {
                  await showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      context: context,
                      builder: (context) {
                        return Container(
                            height: 300,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: StatefulBuilder(
                              builder: (context, state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 12),
                                    Center(
                                      child: Container(
                                        width: 50,
                                        height: 3,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 15,),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          widget.schedule.assistants!=null && widget.schedule.assistants!.contains(user) ? widget.schedule.assistants!.remove(user) : widget.schedule.assistants!.add(user);
                                          Navigator.pop(context);
                                        });

                                      },
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty
                                              .resolveWith((states) =>
                                              EdgeInsets.all(0)),
                                          foregroundColor:
                                          MaterialStateProperty
                                              .resolveWith((states) =>
                                          Colors.black)),
                                      child: SizedBox(
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.admin_panel_settings,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              (widget.schedule.assistants!=null && widget.schedule.assistants!.contains(user) )? "Remove as Assistant" : "Make assistant",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15,),
                                    TextButton(
                                      onPressed: () async {
                                        await showDialog(context: context, builder: (context){
                                          return Dialog(
                                            insetPadding: const EdgeInsets.all(0),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 0, vertical: 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const SizedBox(height: 20,),
                                                  const Text("Are you sure you want to delete member ?",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              widget.schedule.users!.remove(user);
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                                            child: const Text(
                                                              "Oke",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w600),
                                                            ),
                                                          )
                                                      ),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                                            child: const Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w600),
                                                            ),
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                        Navigator.pop(context);
                                      },
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty
                                              .resolveWith((states) =>
                                              const EdgeInsets.all(0)),
                                          foregroundColor:
                                          MaterialStateProperty
                                              .resolveWith((states) =>
                                          Colors.black)),
                                      child: SizedBox(
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: const [
                                            Icon(
                                              Icons.delete,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              "Remove",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            )
                        );
                      });
                },
                icon: Icon(
                  Icons.more_vert,
                  size: 20,
                ))
            : Container(
          child: Column(
            children: [

            ],
          ),
        ),
      ));
    });
    return userList;
  }

  _buildComment(Comment comment) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          comment.person.avatar == null
              ? Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey)),
                  child: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 25,
                  ),
                )
              : Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      comment.person.avatar!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            comment.content,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
            overflow: TextOverflow.visible,
          ))
        ],
      ),
    );
  }

  _buildListComment() {
    List<Widget> listcmt = [];
    listcmt.add(Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            style: const TextStyle(color: Colors.black, fontSize: 15),
            maxLines: 1,
            decoration: const InputDecoration(
                hintText: "Write something here",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1))),
            cursorColor: Colors.black,
            controller: _commentController,
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                comments.add(Comment(
                    content: _commentController.text,
                    person: userDefault,
                    schedule: widget.schedule));
                _commentController.clear();
              });
            },
            icon: Icon(
              Icons.send,
              color: cardColor,
            ))
      ],
    ));
    listcmt.add(const SizedBox(
      height: 10,
    ));
    comments.forEach((cmt) {
      if (cmt.schedule == widget.schedule) {
        listcmt.add(_buildComment(cmt));
        listcmt.add(const SizedBox(
          height: 5,
        ));
      }
    });
    return listcmt;
  }

  _buildNavBar() {
    Color? selectedButton = cardColor;
    Color? unselectedButton = Colors.white;
    Color? selectedText = Colors.white;
    Color? unselectedText = Colors.black;
    List<Widget> navbar = [
      GestureDetector(
        onTap: () {
          setState(() {
            _indexSelected = 0;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          color: _indexSelected == 0 ? selectedButton : unselectedButton,
          child: Text(
            "Tasks",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: _indexSelected == 0 ? selectedText : unselectedText),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            _indexSelected = 1;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          color: _indexSelected == 1 ? selectedButton : unselectedButton,
          child: Text(
            "Members",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: _indexSelected == 1 ? selectedText : unselectedText),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            _indexSelected = 2;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          color: _indexSelected == 2 ? selectedButton : unselectedButton,
          child: Text(
            "Comments",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: _indexSelected == 2 ? selectedText : unselectedText),
          ),
        ),
      ),
    ];
    return navbar;
  }

  _buildOption() {
    return IconButton(
        onPressed: () async {
          await showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) {
                return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: StatefulBuilder(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            Center(
                              child: Container(
                                width: 50,
                                height: 3,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.notifications,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Notifications",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  child: Switch(
                                    value: _isNoti,
                                    onChanged: (bool value) {
                                      state(() {});
                                      setState(() {
                                        _isNoti = !_isNoti;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ), //NOTIFICATIONS
                            const SizedBox(
                              height: 15,
                            ),
                            widget.schedule.owner == userDefault
                                ? Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      StatisticSchedulePage(
                                                        schedule:
                                                            widget.schedule,
                                                      )));
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    const EdgeInsets.all(0)),
                                            foregroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) =>
                                                        Colors.black)),
                                        child: SizedBox(
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Icon(
                                                Icons.stacked_bar_chart,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                "Statistic",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  )
                                : Container(),
                            widget.schedule.owner == userDefault
                                ? Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditSchedulePage(
                                                        schedule:
                                                            widget.schedule,
                                                      ))).then((value) {
                                            setState(() {});
                                          });
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    EdgeInsets.all(0)),
                                            foregroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) =>
                                                        Colors.black)),
                                        child: SizedBox(
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Icon(
                                                Icons.settings,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                "Edit",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  )
                                : Container(),
                            widget.schedule.owner == userDefault
                                ? TextButton(
                                    onPressed: () async {
                                      await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              insetPadding:
                                                  const EdgeInsets.all(0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0,
                                                        vertical: 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    const Text(
                                                      "Are you sure you want to delete the schedule ?",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                schedules.remove(
                                                                    widget
                                                                        .schedule);
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .popUntil(
                                                                      (route) =>
                                                                          route
                                                                              .isFirst);
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                              child: const Text(
                                                                "Oke",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            )),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                              child: const Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    style: ButtonStyle(
                                        padding:
                                            MaterialStateProperty.resolveWith(
                                                (states) => EdgeInsets.all(0)),
                                        foregroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.black)),
                                    child: SizedBox(
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.delete,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Delete",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : TextButton(
                                    onPressed: () async {
                                      await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              insetPadding:
                                                  const EdgeInsets.all(0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0,
                                                        vertical: 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    const Text(
                                                      "Are you sure you want to leave the schedule ?",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                widget.schedule
                                                                    .users!
                                                                    .remove(
                                                                        userDefault);
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .popUntil(
                                                                      (route) =>
                                                                          route
                                                                              .isFirst);
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                              child: const Text(
                                                                "Oke",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            )),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                              child: const Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    style: ButtonStyle(
                                        padding:
                                            MaterialStateProperty.resolveWith(
                                                (states) => EdgeInsets.all(0)),
                                        foregroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.black)),
                                    child: SizedBox(
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.logout,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Exit",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                          ],
                        );
                      },
                    )
                );
              });
        },
        icon: const Icon(
          Icons.more_vert,
          size: 20,
          color: Colors.black,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.schedule.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [_buildOption()],
        ),
        floatingActionButton: _indexSelected == 0
            ? (userDefault == widget.schedule.owner ||
                    widget.schedule.assistants!.contains(userDefault))
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddTaskPage(
                                    scheduleName: widget.schedule.title,
                                  ))).then((value) {
                        setState(() {});
                      });
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text(
                        "Add sub task",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      )),
                    ),
                  )
                : Container()
            : _indexSelected == 1
                ? (userDefault == widget.schedule.owner ||
                        widget.schedule.assistants!.contains(userDefault))
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddMemberSchedulePage(
                                      schedule: widget.schedule))).then(
                              (value) {
                            setState(() {});
                          });
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: Text(
                            "Add member",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          )),
                        ),
                      )
                    : Container()
                : Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.schedule.note!,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                Property(
                  icon: Icons.person,
                  title: "Owner :",
                  widget: Text(
                    widget.schedule.owner.name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Property(
                    icon: Icons.people,
                    title: "Members :",
                    widget: Text(
                      widget.schedule.users!.length.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Property(
                    icon: Icons.check_box,
                    title: "Status :",
                    widget: Text(
                      widget.schedule.tasks!.where((task) =>task.status!=Status.COMPLETED).isEmpty || widget.schedule.tasks == null ? "Completed" : "In progress",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: _buildNavBar(),
                ),
                const SizedBox(
                  height: 15,
                ),
                _indexSelected == 0
                    ? Stack(
                        children: [
                          SizedBox(
                            height: 530,
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 55),
                                  child: SingleChildScrollView(
                                    child: Column(children: _buildListTask()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : _indexSelected == 1
                        ? Stack(
                            children: [
                              SizedBox(
                                height: 530,
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 55),
                                      child: SingleChildScrollView(
                                        child: Column(
                                            children: _buildListMember()),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : SizedBox(
                            height: 530,
                            child: SingleChildScrollView(
                              child: Column(
                                children: _buildListComment(),
                              ),
                            ),
                          )
              ],
            ),
          ),
        ));
  }
}


