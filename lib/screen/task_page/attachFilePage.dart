import 'package:ebook/model/assignment.dart';
import 'package:ebook/model/fileAttach.dart';
import 'package:ebook/model/task.dart';
import 'package:flutter/material.dart';
import '../../model/user.dart';


class AttachFilePage extends StatelessWidget {
  Assignment assignment = Assignment(person: users[0], task: allTask[0],files: files1);

  AttachFilePage({required this.assignment});

  _buildAttachFile(){
    List<Widget> fileWidgets = [];
    assignment.files == null ?Container() : assignment.files!.forEach((file) {
      fileWidgets.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 50,
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(
                children: [
                  Image.asset("assets/docIcon.png",width: 35,height: 35,),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 3,),
                      Text(file.name,style: const TextStyle(color: Colors.black,fontSize: 15),),
                      Text(file.volume,style: const TextStyle(color: Colors.black,fontSize: 13),),
                      const SizedBox(height: 3,),
                    ],
                  )
                ],
              ),
              Row(
                children: const [
                  Text("100%",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
                  SizedBox(width: 15,),
                  Icon(Icons.check_circle,color: Colors.black,size: 20,)
                ],
              )
            ],
          ),
        )
      );
      fileWidgets.add(SizedBox(height: 10,));
    });
    return fileWidgets;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload your work",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 10),
            child: Text((assignment.mark == null ? "?" : assignment.mark.toString()) + "/10",style: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.w400),),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    child: assignment.person.avatar == null ? Container(
                      padding: EdgeInsets.all(2),
                      child: Icon(Icons.person,color: Colors.black,size: 34,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey)),
                    ) :
                    Container(
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                        child: Image.asset(assignment.person.avatar!,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey)
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(assignment.person.name,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),)
                ],
              ),
              assignment.task.status == Status.COMPLETED ? Container(
                padding: EdgeInsets.only(top: 20),
                child : Text(assignment.note??"",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 17,overflow: TextOverflow.visible),)
              ) : Column(
                children: [SizedBox(height: 15,),
                  TextField(
                    style: TextStyle(color: Colors.black,fontSize: 17),
                    maxLines: 2,
                    decoration: InputDecoration(
                        hintText: "Write something here",
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 17),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1)
                        )
                    ),
                    cursorColor: Colors.black,
                  ),
                  SizedBox(height: 20,),
                  Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 50,),
                          Icon(Icons.cloud_upload_outlined,size: 80,color: Colors.black,),
                          SizedBox(height: 20,),
                          TextButton(
                              onPressed: (){},
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Color.lerp(Color.fromARGB(255, 59, 117, 245),
                                          Color.fromARGB(255, 76, 142, 246), 1),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Text("Browse file",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16))
                              )
                          )
                        ],
                      )
                  ),],
              ),
              SizedBox(height: 30,),
              Column(
                children: _buildAttachFile(),
              )

            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 130,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
        ),
        child: FloatingActionButton(
          onPressed: () {  },
          child: Text("Submit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
