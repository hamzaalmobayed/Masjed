import 'package:flutter/material.dart';
import 'package:masjed/bottomBar.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/main.dart';
import 'package:masjed/MoshrefUi/moshref/name.dart';
import 'package:masjed/MoshrefUi/moshref/number.dart';
import 'package:masjed/mainAppBar.dart';
class Moshref extends StatefulWidget {

  @override
  _MoshrefState createState() => _MoshrefState();
}
int notificationCount=1;
class _MoshrefState extends State<Moshref> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: MainAppBar(notificationCount),
      ),
      body: body(),
      endDrawer: DrawerApp(),
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
          Text("اهلا بك, مشرف الحلقات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey),),
          Name("براء سليمان راشد اسليم"),
          SizedBox(height: 60,),

          Text("اخر التحديثات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey),),
          Number("احصائية حضور الطلاب","50", "طالب", "50"),
          Number("احصائية حضور المحفظين","50", "محفظ", "50"),

        ],
      ),
    );
  }
}
