import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/login/textField.dart';
import 'package:masjed/MoshrefUi/searching/searchingTextField.dart';
class SearchingShape extends StatefulWidget {
  String txt;
  TextEditingController con;


  SearchingShape(this.txt,this.con);

  @override
  _SearchingShapeState createState() => _SearchingShapeState();
}

class _SearchingShapeState extends State<SearchingShape> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.txt,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
        SizedBox(height: 5,),
        Container(
          width: 270,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.fromBorderSide(BorderSide(width: 1,)),
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 10.0,
              ),
            ],),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SearchingTextField(widget.con),
          ),
        )
      ],
    );
  }
}
