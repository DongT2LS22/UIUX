import 'package:ebook/model/schedule.dart';
import 'package:ebook/screen/schedule_page/schedulePage.dart';
import 'package:ebook/widget/avatar/avatar_list.dart';
import 'package:flutter/material.dart';

// class ScheduleList extends StatefulWidget {
//   const ScheduleList({Key? key}) : super(key: key);
//
//   @override
//   State<ScheduleList> createState() => _ScheduleListState();
// }
//
// class _ScheduleListState extends State<ScheduleList> {
//   _buildSchedule(BuildContext context, Schedule schedule) {
//     return ScheduleCard(schedule: schedule, width: 240, height: 280);
//   }
//
//   _buildScheduleList(BuildContext context) {
//     List<Widget> schedules = [];
//     scheduleList.forEach((e) {
//       schedules.add(_buildSchedule(context, e));
//       schedules.add(SizedBox(width: 20,));
//     });
//     return schedules;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: _buildScheduleList(context),
//         ));
//   }
// }


// class ScheduleCard extends StatefulWidget {
//
//   Schedule schedule;
//   double width;
//   double height;
//
//
//   ScheduleCard({required this.schedule,required this.width,required this.height});
//
//   @override
//   State<ScheduleCard> createState() => _ScheduleCardState();
// }
//
// class _ScheduleCardState extends State<ScheduleCard> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){Navigator.of(context).push(PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) => SchedulePage(schedule: widget.schedule,),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(0.0, 1.0);
//           const end = Offset.zero;
//           const curve = Curves.ease;
//
//           var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//           return SlideTransition(
//             position: animation.drive(tween),
//             child: child,
//           );
//         },
//       )).then((value){
//         setState(() {
//
//         });
//       });},
//       child: Container(
//         width: widget.width,
//         height: widget.height,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 20, left: 20, bottom: 5, right: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.schedule.title,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     overflow: TextOverflow.ellipsis),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 widget.schedule.endDate!,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w400),
//               ),
//               SizedBox(height: 20,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Progress",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 16,
//                         color: Colors.white),
//                   ),
//                   Text(
//                       (widget.schedule.getProgress()*100).toInt().toString() + "%",
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Stack(
//                 children: [
//                   Container(
//                     height: 10,
//                     width: widget.width-40,
//                   ),
//                   Positioned(
//                     child: Container(
//                       height: 5,
//                       width: widget.width-40,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     top: 2,
//                   ),
//                   Positioned(
//                     child: Container(
//                       height: 7,
//                       width: (widget.width-40)*widget.schedule.getProgress(),
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     top: 1,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.mode_comment_rounded,
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "5",
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.white),
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.access_time_rounded,
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text("4 Days ago",
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.white))
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//         decoration: BoxDecoration(
//           color: Color.lerp(Color.fromARGB(255, 59, 117, 245),
//               Color.fromARGB(255, 76, 142, 246), 1),
//           borderRadius: BorderRadius.circular(10)
//         ),
//       ),
//     );
//   }
// }
