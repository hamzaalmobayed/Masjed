import 'package:flutter/material.dart';
import 'package:masjed/main.dart';
class Name extends StatelessWidget {
String name;

Name(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
             color: mainColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 10.0,
            ),
          ],
        ),
        child:Row(
          children: [
            IconButton(icon:Icon(Icons.account_circle_outlined,size: 35,color: Colors.white,)),
            SizedBox(width: 10,),
            Text(name,style: TextStyle(fontSize: 20,color: Colors.white),),
          ],
        )
    );
  }
}
