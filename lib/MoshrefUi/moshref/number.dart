import 'package:flutter/material.dart';
import 'package:masjed/main.dart';
class Number extends StatelessWidget {
  String title;
  String number;
  String type;
  String total;

  Number(this.title,this.number, this.type, this.total);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color:mainColor),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(

                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 10.0,
                              ),
                            ],
                          color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 2),
                          child: Text(number,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                        ),
                    ),
                    Text(type,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey),),
                    Text(total,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: mainColor),),
                    Text("(كلي)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey),),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
