import 'package:flutter/material.dart';

import 'main.dart';
class NameInAddingData extends StatelessWidget {
var icon;
bool read;
bool enable;
String txtTitle;
String hint;
TextEditingController con=TextEditingController();

NameInAddingData(this.icon, this.read, this.enable, this.txtTitle, this.hint,this.con);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0,right: 10,),
              child: Text(txtTitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white12,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 10.0,
                ),
              ],
              shape: BoxShape.rectangle,
            ),
            child: TextField(

              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              controller: con,
              readOnly: read,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  border: OutlineInputBorder(
                  ),
                  filled: true,
                  enabled: enable,
                  hintText: hint,
                  hintStyle:TextStyle(fontSize: 18,color:mainColor) ,
                  fillColor: Colors.white70),
            ),
          ),
        )
      ],
    );
  }
}
