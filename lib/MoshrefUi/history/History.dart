import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/history/historyShape.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/generalBottomBar.dart';

import '../../appBar.dart';
import '../../bottomBar.dart';
import '../../main.dart';
class History extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton:floatingButton(),
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
  /*************floatingButton**********/
  Widget floatingButton(){
    return Padding(
    padding: const EdgeInsets.only(top: 80.0),
    child: CircleAvatar(
    backgroundColor: Colors.white,
    radius: 35,
    child: FloatingActionButton(
    backgroundColor: mainColor,
    onPressed: (){

    },
    child: Icon(Icons.add,color: Colors.white,size: 30,),
    ),
    ),
    );
  }
  /*************bottomBar**********/
  Widget body(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("سجل الحفاظ",style: TextStyle(fontSize: 20,color: Colors.black),),
                  Icon(Icons.assessment,color: Colors.black,size: 30,)
                ],
              ),
            ),
            HistoryShape("م.", "اسم الحافظ", "رقم الجوال", Colors.white,mainColor,(){}),
            HistoryShape("1", "مهند امين اهل", "0595646914", mainColor,Colors.white,(){}),
            HistoryShape("1", "مهند امين اهل", "0595646914", mainColor,Colors.white,(){}),
            HistoryShape("1", "مهند امين اهل", "0595646914", mainColor,Colors.white,(){}),
            HistoryShape("1", "مهند امين اهل", "0595646914", mainColor,Colors.white,(){}),
            HistoryShape("1", "مهند امين اهل", "0595646914", mainColor,Colors.white,(){}),
            HistoryShape("1", "مهند امين اهل", "0595646914", mainColor,Colors.white,(){}),
            HistoryShape("1", "مهند امين اهل", "0595646914", mainColor,Colors.white,(){}),
            HistoryShape("1", "مهند امين اهل", "0595646914", mainColor,Colors.white,(){}),
            HistoryShape("1", "مهند امين اهل", "0595646914", mainColor,Colors.white,(){}),
          ],
        ),
      ),
    );
  }
}
