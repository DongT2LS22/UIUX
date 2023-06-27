import 'package:ebook/model/notification.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  Noti noti;

  NotificationCard({super.key, required this.noti});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>noti.link)),
      child: Container(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        decoration: const BoxDecoration(
          border : Border(bottom: BorderSide(color: Colors.grey))
        ),
        child: Row(
          children: [
            noti.owner.avatar == null ? Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.grey)),
              child: const Icon(Icons.person,color: Colors.black,size: 25,),
            ) :
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(noti.owner.avatar!,fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(width: 15,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(noti.title,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 17,color: Colors.black,overflow: TextOverflow.ellipsis),),
                const SizedBox(height: 5,),
                Text(noti.content,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.black,overflow: TextOverflow.ellipsis),),
                const SizedBox(height: 5,),
                Text("${noti.date}  ${noti.time}",style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
