import 'package:flutter/material.dart';

import 'main.dart';
class AppBarCustom extends StatelessWidget {
  String txt;
  var icon;
  Function function;
  AppBarCustom(this.txt,this.icon,this.function);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      title: Text(txt),
      backgroundColor: mainColor,
      actions: [
        IconButton(icon: icon,color: Colors.white,iconSize: 40,onPressed: function,),
        SizedBox(width: 10,)
      ],
    );
  }
}
