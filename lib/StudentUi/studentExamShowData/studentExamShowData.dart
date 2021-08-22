import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/drawer/studentDrawer.dart';
import 'package:masjed/MoshrefUi/myData/dataPlace.dart';
import 'package:masjed/appBar.dart';
import 'package:masjed/nameData.dart';
import '../../../../bottomBar.dart';

import '../../generalBottomBar.dart';
import '../../main.dart';

class StudentExamShowData extends StatefulWidget {
  Widget widget;

  StudentExamShowData(this.widget);

  @override
  _StudentExamShowDataState createState() => _StudentExamShowDataState();
}

class _StudentExamShowDataState extends State<StudentExamShowData> {
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
      "ارشيف اختباراتي",
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
          children: [
            NameInAddingData(Icon(Icons.account_circle_outlined,size: 100,color: Colors.black,), read, enable, "اسم الطالب", "عمار راشد براء اسليم",con1),
            SizedBox(height: 20,),
            DataPlace("اسم الجزء", con1, "قد سمع", read, enable),
            DataPlace("تاريخ الاختبار", con1, "12/5/2021", read, enable),
            DataPlace("العلامة بالدرجات", con1, "80", read, enable),
            DataPlace("التقدير", con1, "جيد جدا", read, enable),
            DataPlace("تاريخ الاختبار", con1, "12/5/2021", read, enable),
            DataPlace("الشيخ المختبر", con1, "12/5/2021", read, enable),

          ],
        ),
      ),
    );
  }


}
