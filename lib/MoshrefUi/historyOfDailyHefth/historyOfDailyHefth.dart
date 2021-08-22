import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/StudentHefth/studentHefth.dart';
import 'package:masjed/MoshrefUi/dailyhefth/hefth.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/history/historyButton.dart';
import 'package:masjed/generalBottomBar.dart';
import '../../appBar.dart';
import '../../bottomBar.dart';
import '../../main.dart';
class HistoryOfDailyHefth extends StatelessWidget {
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
      bottomNavigationBar: GeneralBottomBar(Hefth()),
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
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 30,),
            HistoryButton( "تاريخ الحفظ اليومي",300, Colors.white,mainColor,(){}),
            HistoryButton( "21/8/2021",300,mainColor, Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>StudentHefth()));
            }),
            HistoryButton( "21/8/2021",300,mainColor, Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>StudentHefth()));
            }),
            HistoryButton( "21/8/2021",300,mainColor, Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>StudentHefth()));
            }),
            HistoryButton( "21/8/2021",300,mainColor, Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>StudentHefth()));
            }),
            HistoryButton( "21/8/2021",300,mainColor, Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>StudentHefth()));
            }),
            HistoryButton( "21/8/2021",300,mainColor, Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>StudentHefth()));
            }),
            HistoryButton( "21/8/2021",300,mainColor, Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>StudentHefth()));
            }),
            HistoryButton( "21/8/2021",300,mainColor, Colors.white,(){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) =>StudentHefth()));
            }),
          ],
        ),
      ),
    );
  }
}
