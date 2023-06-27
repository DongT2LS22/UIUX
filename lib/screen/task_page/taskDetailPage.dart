import 'package:ebook/constant.dart';
import 'package:ebook/model/assignment.dart';
import 'package:ebook/model/schedule.dart';
import 'package:ebook/screen/task_page/attachFilePage.dart';
import 'package:ebook/screen/task_page/edit_task_page.dart';
import 'package:ebook/screen/task_page/listMemberTaskPage.dart';
import 'package:ebook/screen/task_page/submitTaskPage.dart';
import 'package:ebook/widget/card/property.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/task.dart';
import '../../widget/card/userCard.dart';

class TaskDetailPage extends StatefulWidget {
  Task task;

  TaskDetailPage({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  int? selectedValue;
  bool _isNoti = true;

  isOwner(){
    return userDefault == widget.task.owner;
  }

  isScheduleOwner(){
    Schedule schedule = schedules.firstWhere((schedule) => schedule.tasks!.contains(widget.task) );
    return userDefault == schedule.owner;
  }

  _buildListParticipant() {
    List<Widget> personList = [];
    if(tasksForPersonal.contains(widget.task)) return [Container()];
    widget.task.users!.forEach((person) {
      personList.add(UserCard(
        user: person,
        last: (isOwner() || isScheduleOwner()) && person != userDefault
            ? IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubmitTaskPage(
                              assignment: assignments.firstWhere(
                                  (asm) =>
                                      asm.task == widget.task &&
                                      asm.person == person,
                                  orElse: () => Assignment(
                                      person: person, task: widget.task)))));
                },
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.black,
                  size: 20,
                ))
            : Container(),
      ));
    });
    return personList;
  }

  _buildOption(){
    return IconButton(
        onPressed: () async {
          await showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20)),
              ),
              builder: (context){
                return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20),
                    child: StatefulBuilder(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
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
                                    Icon(Icons.notifications,size: 20,),
                                    SizedBox(width: 15,),
                                    Text("Notifications",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                GestureDetector(
                                  child: Switch(
                                    value: _isNoti,
                                    onChanged: (bool value) {
                                      state((){});
                                      setState(() {
                                        _isNoti = !_isNoti;
                                      }); },
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 15,),//NOTIFICATIONS
                            isOwner() || isScheduleOwner() ? Column(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditTaskPage(task: widget.task))).then((value){setState(() {
                                    });});
                                  },
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(0)),
                                      foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black)
                                  ),
                                  child: SizedBox(
                                    height:50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        Icon(Icons.settings,size: 20,),
                                        SizedBox(width: 15,),
                                        Text("Edit",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15,),
                              ],
                            ):Container(),
                            widget.task.owner == userDefault || schedules.firstWhere((schedule) => schedule.tasks!.contains(widget.task)).owner == userDefault ? TextButton(
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
                                          const Text("Are you sure you want to delete the task ?",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      allTask.remove(widget.task);
                                                    });
                                                    Navigator.of(context).popUntil((route) => route.isFirst);
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
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.all(0)),
                                  foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black)
                              ),
                              child: SizedBox(
                                height:50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(Icons.delete,size: 20,),
                                    SizedBox(width: 15,),
                                    Text("Delete",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),)
                                  ],
                                ),
                              ),
                            ) : TextButton(
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
                                          const Text("Are you sure you want to leave the task ?",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      widget.task.users!.remove(userDefault);
                                                    });
                                                    Navigator.of(context).popUntil((route) => route.isFirst);
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
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.all(0)),
                                  foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black)
                              ),
                              child: SizedBox(
                                height:50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(Icons.logout,size: 20,),
                                    SizedBox(width: 15,),
                                    Text("Exit",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ));
              }
          );
        },
        icon: const Icon(
          Icons.more_vert,
          size: 20,
          color: Colors.black,
        )
    );
  }

  onGoBack(dynamic value) {
    setState(() {});
  }

  getAssignment(){
    Assignment asm = assignments.firstWhere((asm) => (asm.person == userDefault && asm.task == widget.task),orElse: ()=>Assignment(person: userDefault, task: widget.task));
    return asm;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = widget.task.status == Status.TODO
        ? 0
        : widget.task.status == Status.INPROGRESS
            ? 1
            : 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.task.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        actions: [
          widget.task.users!.contains(userDefault) || isScheduleOwner() ? _buildOption() :
          Container()

        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.task.note==null?" " : widget.task.note!,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black),
              ),
              tasksForPersonal.contains(widget.task) ? Container() : Column(children: [const SizedBox(
                height: 15,
              ),
                Property(
                  icon: Icons.person,
                  title: "Owner :",
                  widget: Text(
                    widget.task.owner.name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),],),
              const SizedBox(
                height: 5,
              ),
              Property(
                icon: Icons.check_box,
                title: "Status :",
                widget: widget.task.owner == userDefault
                    ? TextButton(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Color.lerp(Color.fromARGB(255, 59, 117, 245),
                                  Color.fromARGB(255, 76, 142, 246), 1)),
                          child: Text(
                            selectedValue == 0
                                ? "To do"
                                : selectedValue == 1
                                    ? "In progress"
                                    : "Completed",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        ),
                        onPressed: () async {
                          await showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 250,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: StatefulBuilder(
                                      builder: (context, state) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            const Center(
                                              child: Text(
                                                "Status",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "To do",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black,
                                                          fontSize: 17),
                                                    ),
                                                    Radio<int>(
                                                      onChanged: (value) {
                                                        state(() {});
                                                        setState(() {
                                                          selectedValue = value!;
                                                          widget.task.status =
                                                              Status.TODO;
                                                        });
                                                      },
                                                      value: 0,
                                                      groupValue: selectedValue,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "In progress",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black,
                                                          fontSize: 17),
                                                    ),
                                                    Radio<int>(
                                                      onChanged: (value) {
                                                        state(() {});
                                                        setState(() {
                                                          selectedValue = value!;
                                                          widget.task.status =
                                                              Status.INPROGRESS;
                                                        });
                                                      },
                                                      value: 1,
                                                      groupValue: selectedValue,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Completed",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black,
                                                          fontSize: 17),
                                                    ),
                                                    Radio<int>(
                                                      onChanged: (value) {
                                                        state(() {});
                                                        setState(() {
                                                          selectedValue = value!;
                                                          widget.task.status =
                                                              Status.COMPLETED;
                                                        });
                                                      },
                                                      value: 2,
                                                      groupValue: selectedValue,
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    ));
                              });
                        },
                      )
                    : Container(
                  margin: EdgeInsets.only(top: 12,bottom: 12),
                      child: Text(
                          selectedValue == 0
                              ? "To do"
                              : selectedValue == 1
                                  ? "In progress"
                                  : "Completed",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Property(
                icon: Icons.calendar_today_outlined,
                title: "Due date :",
                widget: Text(
                  DateFormat.yMMMd().format(widget.task.date),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Property(
                icon: Icons.access_time,
                title: "Start :",
                widget: Text(
                  widget.task.startTime!,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Property(
                icon: Icons.access_time,
                title: "End :",
                widget: Text(
                  widget.task.endTime!,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              tasksForPersonal.contains(widget.task) ?
                  Container() : Column(
                children: [
                  widget.task.users!.contains(userDefault) ? Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      userDefault != widget.task.owner ? Property(
                        icon: Icons.file_present_outlined,
                        title: "Add your work",
                        widget: TextButton(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Color.lerp(Color.fromARGB(255, 59, 117, 245),
                                    Color.fromARGB(255, 76, 142, 246), 1)),
                            child: Text(
                              widget.task.status == Status.COMPLETED ? "View" : "+ Add",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AttachFilePage(
                                      assignment: getAssignment(),
                                    )));
                          },
                        ),
                      ) : Container(
                        height: 0,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          Property(
                            icon: Icons.file_present_outlined,
                            title: "File attach",
                            widget: userDefault != widget.task.owner ?  Text("test1.docs") : TextButton(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Color.lerp(Color.fromARGB(255, 59, 117, 245),
                                        Color.fromARGB(255, 76, 142, 246), 1)),
                                child: Text(
                                  widget.task.status == Status.COMPLETED ? "View" : "+ Add",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AttachFilePage(
                                          assignment: getAssignment(),
                                        )));
                              },
                            ),
                          ),
                          userDefault != widget.task.owner ? const SizedBox(
                            height: 20,
                          ) : SizedBox(height: 5,),
                        ],
                      ),
                    ],
                  ) : Container(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Participants",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      Container(
                        child: widget.task.owner.name == userDefault.name
                            ? IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListMemberOnTaskPage(
                                              task: widget.task)))
                                  .then((value) => onGoBack(value));
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 27,
                            ))
                            : Container(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 400,
                child:  SingleChildScrollView(
                  child: Column(
                    children: _buildListParticipant(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
