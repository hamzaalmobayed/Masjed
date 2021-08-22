import 'package:flutter/material.dart';
import 'package:masjed/main.dart';
class ProcessButton extends StatelessWidget {
  Icon icon;
  String name;
  Function function;

  ProcessButton(this.icon, this.name,this.function);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: mainColor,width: 3)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 10.0,
              ),
            ],
          ),
          child:ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                  )
              )
            ),
            onPressed: function,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: icon,),
                SizedBox(width: 10,),
                Text(name,style: TextStyle(fontSize: 20,color: mainColor),),
              ],
            ),
          )
      ),
    );
  }
}
