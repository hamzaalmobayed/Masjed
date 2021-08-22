import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/history/historyButton.dart';
class ExamResult extends StatelessWidget {
  String txt1;
  String txt2;
  String txt3;
  String txt4;
  Color textColor;
  Color backGroundColor;
  Function function;
  ExamResult(
      this.txt1, this.txt2, this.txt3,this.txt4, this.textColor, this.backGroundColor,this.function);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(flex:1,child: HistoryButton(txt1, 30,textColor,backGroundColor,function),),
          SizedBox(width: 8,),
          Expanded(flex:3,child: HistoryButton(txt2, 100,textColor,backGroundColor,function),),
          SizedBox(width: 8,),
          Expanded(flex:3,child: HistoryButton(txt3, 70,textColor,backGroundColor,function)),
          SizedBox(width: 8,),
          Expanded(flex:2,child: HistoryButton(txt4, 70,textColor,backGroundColor,function)),
        ],
      ),
    );
  }
}
