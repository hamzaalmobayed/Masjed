import 'package:flutter/material.dart';

class StudentButtonScreen extends StatelessWidget {
  var icon;
  String txt;
  Function function;

  StudentButtonScreen(this.icon, this.txt,this.function);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(onPressed: function, child: Column(
        children: [
          icon,
          SizedBox(height: 10,),
          Text(txt,style: TextStyle(fontSize: 18,color: Colors.black),),
        ],
      )),
    );
  }
}
