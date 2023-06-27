import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../model/user.dart';
import '../../model/schedule.dart';
import '../../widget/card/userCard.dart';
import '../../widget/field/searchField.dart';

class AddMemberSchedulePage extends StatefulWidget {
  Schedule schedule;
  AddMemberSchedulePage({required this.schedule});

  @override
  State<AddMemberSchedulePage> createState() => _AddMemberSchedulePageState();
}

class _AddMemberSchedulePageState extends State<AddMemberSchedulePage> {
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
          onPressed: () { Navigator.pop(context); },
          backgroundColor: cardColor,
          child: Text("Submit",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
        ),
      ),
    );
  }

  _buildListMemberOnSchdule(){
    List<Widget> members = [];
    users!.forEach((person) {
      if(!widget.schedule.users!.contains(person)){
        members.add(
            UserCard(user: person,last: Row(
              children: [
                TextButton(onPressed:(){
                  setState(() {
                    widget.schedule.users!.add(person);
                  });
                } , child: Text("Invite"))
              ],
            ),)
        );
        members.add(
            SizedBox(height: 10,)
        );
      }
    });
    return members;
  }
}