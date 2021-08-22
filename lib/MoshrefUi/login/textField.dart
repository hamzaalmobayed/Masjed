import 'package:flutter/material.dart';

import '../../main.dart';
class TextFieldShape extends StatelessWidget {
String txt;
TextInputType type;
bool isobsecure;
Icon icon;
TextEditingController controller=TextEditingController();
TextFieldShape(this.txt, this.controller,this.icon,this.type,this.isobsecure);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
          controller: controller,
          keyboardType:type,
          obscureText: isobsecure,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            prefixIcon: icon,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1,color: mainColor),
                borderRadius: BorderRadius.circular(50.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color:mainColor, width: 2),
                borderRadius: BorderRadius.circular(50.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800],fontSize: 16,),
              hintText: txt,
              fillColor: Colors.white70),
        ),

    );
  }
}
