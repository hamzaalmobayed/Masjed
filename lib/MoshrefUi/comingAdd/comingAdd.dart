import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/dailyhefth/hefthShape.dart';
import 'package:masjed/MoshrefUi/dataProcessScreen/screen.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/generalBottomBar.dart';
import '../../appBar.dart';
import '../../bottomBar.dart';
import '../../lists.dart';
import '../../main.dart';
class ComingAdd extends StatefulWidget {
  @override
  _ComingAddState createState() => _ComingAddState();
}

class _ComingAddState extends State<ComingAdd> {
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
      bottomNavigationBar: GeneralBottomBar(Screen(coming, "حضور المحفظين")),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: floatingButton(),
    );
  }

  /*************appBar**********/
  Widget appBar() {
    return AppBarCustom(
      "اضافة حضور المحفظين",
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

  Widget floatingButton(){
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 35,
        child: FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: (){
            setState(() {
            });
          },
          child: Icon(Icons.add,color: Colors.white,size: 30,),
        ),
      ),
    );
  }

  /*************body**********/
  Widget body(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 40),
        child: Column(
          children: [
            HefthShape("ح.", "اسم المحفظ",  Colors.white,mainColor,(){}),
            HefthShape("", "مهند امين اهل", mainColor,Colors.white,(){}),
            HefthShape("", "مهند امين اهل", mainColor,Colors.white,(){}),
            HefthShape("", "مهند امين اهل", mainColor,Colors.white,(){}),
            HefthShape("", "مهند امين اهل", mainColor,Colors.white,(){}),
            HefthShape("", "مهند امين اهل", mainColor,Colors.white,(){}),
            HefthShape("", "مهند امين اهل", mainColor,Colors.white,(){}),
            HefthShape("", "مهند امين اهل", mainColor,Colors.white,(){}),
            HefthShape("", "مهند امين اهل", mainColor,Colors.white,(){}),
            HefthShape("", "مهند امين اهل", mainColor,Colors.white,(){}),
            HefthShape("", "مهند امين اهل", mainColor,Colors.white,(){}),

          ],
        ),
      ),
    );
  }
}
