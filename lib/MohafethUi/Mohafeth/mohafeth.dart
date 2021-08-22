import 'package:flutter/material.dart';
import 'package:masjed/MohafethUi/Mohafeth/mohafethStudentComing.dart';
import 'package:masjed/MohafethUi/Mohafeth/mohafethStudentNumber.dart';
import 'package:masjed/MoshrefUi/drawer/mohafethDrawer.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/MoshrefUi/moshref/name.dart';
import 'package:masjed/bottomBar.dart';
import 'package:masjed/main.dart';
import '../../mainAppBar.dart';
import 'bestStudent.dart';
class Mohafeth extends StatefulWidget {

  @override
  _MohafethState createState() => _MohafethState();
}
class _MohafethState extends State<Mohafeth> {
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: MainAppBar(notificationCount),
      ),
      body: body(),
      endDrawer: MohafethDrawer(),
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
          MohafethStudentComing("احصائية حضور الطلاب", "10", "طالب"),
          MohafethStudentNumber("احصائية صفحات الحفظ و المراجعة", "8", "حفظ", "15", "مراجعة"),
          BestStudent("افضل طالب في الحلقة", "مهند اكرم اهل")

        ],
      ),
    );
  }
}
