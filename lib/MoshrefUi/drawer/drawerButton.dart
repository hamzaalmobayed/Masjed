import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  var icon;
  String txt;
  Function function;

  DrawerButton(this.icon, this.txt,this.function);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(onPressed: function, child: Row(
        children: [
          icon,
          SizedBox(width: 20,),
          Text(txt,style: TextStyle(fontSize: 18,color: Colors.black),),
        ],
      )),
    );
  }
}
