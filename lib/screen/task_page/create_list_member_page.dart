import 'package:ebook/model/schedule.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../model/user.dart';
import '../../widget/card/userCard.dart';
import '../../widget/field/searchField.dart';

class CreateListMemberPage extends StatefulWidget {
  Schedule schedule;
  List<User> userList;
  CreateListMemberPage({Key? key,required this.schedule,required this.userList}) : super(key: key);

  @override
  State<CreateListMemberPage> createState() => _CreateListMemberPageState();
}

class _CreateListMemberPageState extends State<CreateListMemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add member",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
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
    widget.schedule.users!.forEach((user) {
      if(user != userDefault)
        {
          members.add(
              UserCard(user: user,last: Row(
                children: [
                  widget.userList.contains(user) ?
                  TextButton(onPressed:(){
                    setState(() {
                      widget.userList!.remove(user);
                    });
                  } , child: Text("Invited")) :
                  TextButton(onPressed:(){
                    setState(() {
                      widget.userList!.add(user);
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
