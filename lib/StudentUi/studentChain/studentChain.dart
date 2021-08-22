import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/drawer/studentDrawer.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/MoshrefUi/myData/dataPlace.dart';
import 'package:masjed/appBar.dart';
import 'package:masjed/main.dart';

import 'package:masjed/nameData.dart';

import '../../bottomBar.dart';
import '../../generalBottomBar.dart';
class StudentChain extends StatefulWidget {
  Widget widget;

  StudentChain(this.widget);

  @override
  _StudentChainState createState() => _StudentChainState();
}

class _StudentChainState extends State<StudentChain> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool enable=false;

  bool read=true;
  TextEditingController con1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBar(),
      ),
      body: body(),
      endDrawer: StudentDrawer(),
      endDrawerEnableOpenDragGesture: false,
      bottomNavigationBar: GeneralBottomBar(widget.widget),
    );
  }

  /*************appBar**********/
  Widget appBar() {
    return AppBarCustom(
      "بيانات الحلقة",
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
        padding: const EdgeInsets.only(top:20.0,left: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("حلقتي و المحفظون",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
            SizedBox(height: 20,),
            NameInAddingData(ImageIcon(
              AssetImage("images/group.png"),
              color: Colors.black,
              size: 70,
            ), read, enable, "اسم الحلقة", "عمار راشد براء اسليم",con1),
            SizedBox(height: 20,),
            DataPlace("محفظ الحلقة", con1, "زكريا ابو كميل", read, enable),
            DataPlace("المحفظ المساعد", con1, "انس عماد حبوب", read, enable),

          ],
        ),
      ),
    );
  }


}
