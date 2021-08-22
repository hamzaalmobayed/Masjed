import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/DailyHefthShow/dailyHefthShow.dart';
import 'package:masjed/MoshrefUi/dailyhefth/hefthShape.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/historyOfDailyHefth/historyOfDailyHefth.dart';
import 'package:masjed/generalBottomBar.dart';

import '../../appBar.dart';
import '../../bottomBar.dart';
import '../../main.dart';
class StudentHefth extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  @override
  Widget build(BuildContext cont) {
    context=cont;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBar(),
      ),

      body: body(),
      endDrawer: DrawerApp(),
      endDrawerEnableOpenDragGesture: false,
      bottomNavigationBar: GeneralBottomBar(HistoryOfDailyHefth()),
    );
  }
  /*************appBar**********/
  Widget appBar() {
    return AppBarCustom(
      "ارشيف الحفظ اليومي",
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
  /*************bottomBar**********/
  Widget body(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 40),
        child: Column(
          children: [
            HefthShape("م.", "اسم الطالب",  Colors.white,mainColor,(){}),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>DailyHefthShow(StudentHefth(),DrawerApp())));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>DailyHefthShow(StudentHefth(),DrawerApp())));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>DailyHefthShow(StudentHefth(),DrawerApp())));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>DailyHefthShow(StudentHefth(),DrawerApp())));

            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>DailyHefthShow(StudentHefth(),DrawerApp())));

            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>DailyHefthShow(StudentHefth(),DrawerApp())));

            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>DailyHefthShow(StudentHefth(),DrawerApp())));

            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>DailyHefthShow(StudentHefth(),DrawerApp())));

            }),

          ],
        ),
      ),
    );
  }
}
