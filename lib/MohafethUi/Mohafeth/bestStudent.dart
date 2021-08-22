import 'package:flutter/material.dart';
import 'package:masjed/main.dart';
class BestStudent extends StatelessWidget {
  String title;
  String number;
  String type;


  BestStudent(this.title, this.type, );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 10.0,
                ),
              ],
              border: Border.fromBorderSide(BorderSide(width: 8,color: mainColor,)),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,style: TextStyle(fontSize: 18,color:mainColor),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(type,style: TextStyle(fontSize: 18,color: Colors.grey),),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
