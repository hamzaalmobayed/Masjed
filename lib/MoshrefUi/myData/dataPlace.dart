import 'package:flutter/material.dart';

import '../../main.dart';
class DataPlace extends StatelessWidget {
  String txt;
  String data;
  TextEditingController controller=TextEditingController();
  bool enable;
  bool read;
  DataPlace(this.txt, this.controller,this.data,this.read,this.enable);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Row(
        children: [
          Expanded(flex:2,child: Text(txt,style: TextStyle(fontSize: 18,color: Colors.black),)),
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
        ],
      ),
    );
  }
}
