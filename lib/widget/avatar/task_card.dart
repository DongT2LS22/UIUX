import 'package:ebook/screen/task_page/taskDetailPage.dart';
import 'package:ebook/widget/avatar/avatar_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/task.dart';

class TaskCard extends StatelessWidget {
  Task task;
  String schedule;
  Color bgColor;
  TaskCard({Key? key, required this.task,required this.schedule,required this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
        margin: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      schedule,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.white,overflow: TextOverflow.ellipsis)
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 11,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${task.startTime!} - ${task.endTime!}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Colors.white)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              AvatarList(users: task.users!,size: 28,),
            ],
          ),
        ),
      ),
    );
  }
}
