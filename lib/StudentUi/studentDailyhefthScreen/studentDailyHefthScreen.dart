import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masjed/MohafethUi/Mohafeth/mohafeth.dart';
import 'package:masjed/MoshrefUi/DailyHefthShow/dailyHefthShow.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/drawer/mohafethDrawer.dart';
import 'package:masjed/MoshrefUi/drawer/studentDrawer.dart';
import 'package:masjed/MoshrefUi/examSuccessAdding/examSuccessAdding.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/MoshrefUi/report/reportFieldShape.dart';
import 'package:masjed/MoshrefUi/reportAdding/reportAdding.dart';
import 'package:masjed/MoshrefUi/studentSuccessAdding/StudentSuccessAdding.dart';
import 'package:masjed/StudentUi/student/student.dart';
import 'package:masjed/generalBottomBar.dart';

import '../../appBar.dart';
import '../../bottomBar.dart';
import '../../main.dart';
class StudentDailyHefthScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext cont;
  @override
  Widget build(BuildContext context) {
    cont=context;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBar(),
      ),
      endDrawer: StudentDrawer(),
      endDrawerEnableOpenDragGesture: false,
      body: body(),
      bottomNavigationBar: GeneralBottomBar(Student()),
    );
  }
  /*************appBar**********/
  Widget appBar() {
    return AppBarCustom(
      "",
      ImageIcon(
        AssetImage("images/list.jpg"),
        color: Colors.white,
        size: 30,
      ),
          () {
        _scaffoldKey.currentState.openEndDrawer();
      },
    );
  }
  /*************body**********/
  Widget body(){
    return Center(
      child: SingleChildScrollView(

        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 314,
                height: 210,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ],
                    color:mainColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    ReportShape(" اختر تاريخ","",[]),
                  ],
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 80),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(cont).pushReplacement(
                        MaterialPageRoute(
                            builder: (con) => DailyHefthShow(StudentDailyHefthScreen(),StudentDrawer())));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side: BorderSide(width: 2,color: mainColor),
                            borderRadius: BorderRadius.circular(50.0),
                          )
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("تم",style: TextStyle(fontSize: 20,color: mainColor,fontWeight: FontWeight.bold,),),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
