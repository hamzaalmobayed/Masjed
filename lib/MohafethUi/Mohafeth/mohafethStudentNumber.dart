import 'package:flutter/material.dart';
import 'package:masjed/main.dart';
class MohafethStudentNumber extends StatelessWidget {
  String title;
  String number;
  String type;
  String number2;
  String type2;

  MohafethStudentNumber(this.title,this.number, this.type, this.number2,this.type2);

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
                Text(title,style: TextStyle(fontSize: 18,color:mainColor),),
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
                    Text(type,style: TextStyle(fontSize: 18,color: Colors.grey),),
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
                        child: Text(number2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                      ),
                    ),
                    Text(type2,style: TextStyle(fontSize: 20,color: Colors.grey),),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
