import 'package:flutter/material.dart';
import 'package:masjed/MohafethUi/Mohafeth/mohafethStudentComing.dart';
import 'package:masjed/MohafethUi/studentExam/studentExam.dart';
import 'package:masjed/MoshrefUi/drawer/drawerButton.dart';
import 'package:masjed/MoshrefUi/drawer/mohafethDrawer.dart';
import 'package:masjed/MoshrefUi/drawer/studentDrawer.dart';
import 'package:masjed/MoshrefUi/examDataShow/examDataShow.dart';
import 'package:masjed/MoshrefUi/examSearchData/examResult.dart';
import 'package:masjed/MoshrefUi/examSearchData/examSearchingData.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/MoshrefUi/moshref/name.dart';
import 'package:masjed/MoshrefUi/studentSuccessAdding/StudentSuccessAdding.dart';
import 'package:masjed/StudentUi/student/studentButtonScreen.dart';
import 'package:masjed/StudentUi/studentChain/studentChain.dart';
import 'package:masjed/StudentUi/studentDailyhefthScreen/studentDailyHefthScreen.dart';
import 'package:masjed/StudentUi/studentData/studentData.dart';
import 'package:masjed/StudentUi/studentExamData/studentExamData.dart';
import 'package:masjed/StudentUi/studentScreenReport/srudentScreenReport.dart';
import 'package:masjed/bottomBar.dart';
import 'package:masjed/main.dart';

import '../../mainAppBar.dart';
class Student extends StatefulWidget {

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: MainAppBar(notificationCount),
      ),
      body: body(),
      endDrawer: StudentDrawer(),
      endDrawerEnableOpenDragGesture: false,
      bottomNavigationBar: BottomBar(),
    );
  }

  /*************body**********/

  Widget body(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
      child: ListView(
        children: [
          SizedBox(height: 50,),
          Text("???????? ????, ????????????",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey),),
          Name("???????? ???????????? ???????? ??????????"),
          SizedBox(height: 40,),

          Text("?????? ??????????????????",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey),),
          MohafethStudentComing("?????????? ?????????? ??????????", "10", "?????????? ??????????????"),
          Text("????????????????????",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey),),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: StudentButtonScreen(
                    ImageIcon(
                      AssetImage("images/sheet.png"),
                      color: Colors.black,
                      size: 40,
                    ),
                    "??????????????",
                        () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>StudentDataShowScreen(Student())));
                        }),
              ),
              Expanded(
                flex: 1,
                child: StudentButtonScreen(
                    ImageIcon(
                      AssetImage("images/cup.png"),
                      color: Colors.black,
                      size: 40,
                    ),
                    "???????????????? ",
                        () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>StudentScreenReport()));
                        }),
              ),
              Expanded(
                flex: 1,
                child: StudentButtonScreen(
                    Icon(Icons.image_search,
                      color: Colors.black,
                      size: 40,),
                    "?????????????? ",
                        () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>StudentDailyHefthScreen()));
                        }),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: StudentButtonScreen(
                    Icon(
                      Icons.card_giftcard,
                      color: Colors.black,
                      size: 40,
                    ),
                    "????????????????????",
                        () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>StudentExamData()));
                        }),
              ),
              Expanded(
                flex: 1,
                child: StudentButtonScreen(
                    Icon(
                      Icons.people_alt_outlined,
                      color: Colors.black,
                      size: 40,
                    ),
                    "???????????????? ",
                        () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>StudentChain(Student())));
                        }),
              ),
              Expanded(
                flex: 1,
                child: StudentButtonScreen(
                    Icon(Icons.notifications_none,
                      color: Colors.black,
                      size: 40,),
                    "?????????????????? ",
                        () {
                    }),
              ),
            ],
          )

        ],
      ),
    );
  }
}
