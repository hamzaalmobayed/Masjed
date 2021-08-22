import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/history/historyButton.dart';
class HistoryShape extends StatelessWidget {
  String txt1;
  String txt2;
  String txt3;
  Color textColor;
  Color backGroundColor;
  Function function;
  HistoryShape(
      this.txt1, this.txt2, this.txt3, this.textColor, this.backGroundColor,this.function);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(flex:1,child: HistoryButton(txt1, 30,textColor,backGroundColor,function),),
          SizedBox(width: 8,),
          Expanded(flex:4,child: HistoryButton(txt2, 100,textColor,backGroundColor,function),),
          SizedBox(width: 8,),
          Expanded(flex:3,child: HistoryButton(txt3, 70,textColor,backGroundColor,function)),
        ],
      ),
    );
  }
}
