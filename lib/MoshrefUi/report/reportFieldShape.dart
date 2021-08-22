import 'package:flutter/material.dart';
class ReportShape extends StatefulWidget {
  String txt;
  String value;
  List<String> item=[];

  ReportShape(this.txt, this.value, this.item);

  @override
  _ReportShapeState createState() => _ReportShapeState();
}

class _ReportShapeState extends State<ReportShape> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.txt,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
        SizedBox(height: 5,),
        Container(
          width: 270,
          height: 50,
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
