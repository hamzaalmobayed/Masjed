import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/history/historyButton.dart';
class HefthShape extends StatelessWidget {
  String txt1;
  String txt2;
  Color textColor;
  Color backGroundColor;
  Function function;

  HefthShape(
      this.txt1, this.txt2, this.textColor, this.backGroundColor,this.function);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0,),
      child: Row(
        children: [
          Expanded(flex:1,child: HistoryButton(txt1, 10,textColor,backGroundColor,function),),
          SizedBox(width: 20,),
          Expanded(flex:5,child: HistoryButton(txt2, 100,textColor,backGroundColor,function),),
        ],
      ),
    );
  }
}
