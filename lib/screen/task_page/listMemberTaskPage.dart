
import 'package:ebook/constant.dart';
import 'package:ebook/model/schedule.dart';
import 'package:ebook/screen/task_page/addMemberTaskPage.dart';
import 'package:ebook/widget/card/userCard.dart';
import 'package:ebook/widget/field/searchField.dart';
import 'package:flutter/material.dart';
import '../../model/task.dart';

class ListMemberOnTaskPage extends StatefulWidget {
  Task task;
  ListMemberOnTaskPage({required this.task});

  @override
  State<ListMemberOnTaskPage> createState() => _ListMemberOnTaskPageState();
}

class _ListMemberOnTaskPageState extends State<ListMemberOnTaskPage> {
  late Task _task;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _task = widget.task;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Team member",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon : Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,),onPressed: ()=>Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SearchField(),
              SizedBox(height: 20,),
              Column(
                children: _buildListMemberOnSchdule(),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMemberOnTaskPage(schedule: schedules.firstWhere((schedule) => schedule.tasks!.contains(_task)), task: _task))).then((value){setState(() {});});
          },
          backgroundColor: cardColor,
          child: Text("Add member",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
        ),
      ),
    );
  }

  _buildListMemberOnSchdule(){
    List<Widget> members = [];
    _task.users!.forEach((element) {
      members.add(
        UserCard(user: element,last: Row(
          children: [
            IconButton(onPressed: (){
              setState(() {
                widget.task.users!.remove(element);
              });
            }, icon: Icon(Icons.delete,size: 23,color: Colors.black,))
          ],
        ),)
      );
      members.add(
          SizedBox(height: 10,)
      );
    });
    return members;
  }
}

