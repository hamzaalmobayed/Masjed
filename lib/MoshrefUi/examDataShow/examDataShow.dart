import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/dataProcessScreen/screen.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/examSuccessAdding/examSuccessAdding.dart';
import 'package:masjed/MoshrefUi/history/historyShape.dart';
import 'package:masjed/generalBottomBar.dart';

import '../../appBar.dart';
import '../../bottomBar.dart';
import '../../lists.dart';
import '../../main.dart';
class ExamDataShow extends StatelessWidget {
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
      body: body(),
      endDrawer: DrawerApp(),
      endDrawerEnableOpenDragGesture: false,
      bottomNavigationBar: GeneralBottomBar(Screen(chains, "الحلقات القرانية")),

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("ارشيف الاختبارات",style: TextStyle(fontSize: 20,color: Colors.black),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            HistoryShape("م.", "اسم الطالب", "الجزء المختبر", Colors.white,mainColor,(){}),
            HistoryShape("1", "مؤمن اكرم اهل", "قد سمع", Colors.black,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamDataShow(),DrawerApp())));
            }),
            HistoryShape("1", "مؤمن اكرم اهل", "قد سمع", Colors.black,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamDataShow(),DrawerApp())));
            }),
            HistoryShape("1", "مؤمن اكرم اهل", "قد سمع", Colors.black,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamDataShow(),DrawerApp())));
            }),
            HistoryShape("1", "مؤمن اكرم اهل", "قد سمع", Colors.black,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamDataShow(),DrawerApp())));
            }),
            HistoryShape("1", "مؤمن اكرم اهل", "قد سمع", Colors.black,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamDataShow(),DrawerApp())));
            }),
            HistoryShape("1", "مؤمن اكرم اهل", "قد سمع", Colors.black,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamDataShow(),DrawerApp())));
            }),
            HistoryShape("1", "مؤمن اكرم اهل", "قد سمع", Colors.black,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamDataShow(),DrawerApp())));
            }),
            HistoryShape("1", "مؤمن اكرم اهل", "قد سمع", Colors.black,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamDataShow(),DrawerApp())));
            }),

          ],
        ),
      ),
    );
  }
}
