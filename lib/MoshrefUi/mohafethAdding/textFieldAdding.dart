import 'package:flutter/material.dart';
import 'package:masjed/main.dart';
class TextFieldAdding extends StatelessWidget {
  String hint;
  TextEditingController con= TextEditingController();
  TextFieldAdding(this.hint,this.con);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: con,
      decoration: new InputDecoration(
          hintText: hint,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:mainColor,width: 2),
            //  when the TextFormField in unfocused
          ) ,
          border: new UnderlineInputBorder(
              borderSide: new BorderSide(
                  color: mainColor
              )
          )
      ),
    );
  }
}
