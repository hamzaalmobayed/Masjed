import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/historyOfDailyHefth/historyOfDailyHefth.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/generalBottomBar.dart';

import '../../appBar.dart';
import '../../bottomBar.dart';
import '../../main.dart';
import 'hefthShape.dart';
class Hefth extends StatelessWidget {
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
      bottomNavigationBar: GeneralBottomBar(Moshref()),
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
  /*************body**********/
  Widget body(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 40),
        child: Column(
          children: [
            HefthShape("م.", "اسم الحلقة",  Colors.white,mainColor,(){}),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => HistoryOfDailyHefth()));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => HistoryOfDailyHefth()));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => HistoryOfDailyHefth()));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => HistoryOfDailyHefth()));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => HistoryOfDailyHefth()));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => HistoryOfDailyHefth()));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => HistoryOfDailyHefth()));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => HistoryOfDailyHefth()));
            }),
            HefthShape("1", "مهند امين اهل", mainColor,Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => HistoryOfDailyHefth()));
            }),


          ],
        ),
      ),
    );
  }
}
