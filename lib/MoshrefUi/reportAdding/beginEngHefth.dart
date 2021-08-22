import 'package:flutter/material.dart';

import '../../main.dart';
class BeginEngHefth extends StatelessWidget {
  String txt1;
  String txt2;
  String txt3;
  String data;
  TextEditingController controller=TextEditingController();
  TextEditingController controller2=TextEditingController();
  bool enable;
  bool read;
  BeginEngHefth(this.txt1 ,this.txt2,this.txt3,this.controller,this.controller2,this.data,this.read,this.enable);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Row(
        children: [
          Expanded(flex:3,child: Text(txt1,style: TextStyle(fontSize: 18,color: Colors.black),)),
          Expanded(flex:1,child: Text(txt2,style: TextStyle(fontSize: 18,color: Colors.black),)),
          Expanded(
            flex: 1,
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.white,
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
                readOnly: read,
                controller: controller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                    border: OutlineInputBorder(
                    ),
                    filled: true,
                    enabled: enable,
                    hintText: data,
                    hintStyle:TextStyle(fontSize: 18,color:mainColor) ,
                    fillColor: Colors.white70),
              ),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(flex:1,child: Text(txt3,style: TextStyle(fontSize: 16,color: Colors.black),)),
          Expanded(
            flex: 2,
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.white,
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
                readOnly: read,
                controller: controller2,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                    border: OutlineInputBorder(
                    ),
                    filled: true,
                    enabled: enable,
                    hintText: data,
                    hintStyle:TextStyle(fontSize: 18,color:mainColor) ,
                    fillColor: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
