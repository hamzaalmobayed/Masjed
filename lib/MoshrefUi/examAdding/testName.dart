import 'package:flutter/material.dart';
class TestName extends StatefulWidget {
  String txtTitle;
  String value;
  List<String> item;

  TestName( this.txtTitle,this.item, this.value);

  @override
  _TestNameState createState() => _TestNameState();
}

class _TestNameState extends State<TestName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0,right: 10,),
              child: Text(widget.txtTitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
            ),
          ],
        ),
        Container(
          width: 500,
          decoration: new BoxDecoration(
            color: Colors.white12,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[350],
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 10.0,
              ),
            ],
            shape: BoxShape.rectangle,
          ),
          child:Container(
            width: 500,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              border: Border.fromBorderSide(BorderSide(width: 1,)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350],
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 10.0,
                ),
              ],),
            child: DropdownButton<String>(

              isExpanded: true,
              underline: SizedBox(),
              icon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,),
              iconSize: 30,
              items: widget.item.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 100),
                    child: new Text(value),
                  ),
                );
              }).toList(),
              onChanged: (v) {
                widget.value = v;
                setState(() {});
              },
              value: widget.value,
            ),
          ),
        )
      ],
    );
  }
}
