

import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/dailyhefth/hefth.dart';
import 'package:masjed/MoshrefUi/dataProcessScreen/screen.dart';
import 'package:masjed/MoshrefUi/history/History.dart';
import 'package:masjed/MoshrefUi/login/loginScreen.dart';
import 'package:masjed/MoshrefUi/messaging/message.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/MoshrefUi/myData/myData.dart';
import 'package:masjed/MoshrefUi/reportAdding/reportAdding.dart';
import 'package:masjed/appBar.dart';
import 'package:masjed/lists.dart';
import 'package:masjed/provider.dart';
import 'package:provider/provider.dart';
import 'drawerButton.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          AppBarCustom(
            "",
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 30,
              ), () {
            Navigator.of(context).pop();
          }),
          DrawerButton(
              Icon(
                Icons.people_alt_outlined,
                color: Colors.black,
                size: 30,
              ),
              "بيانات المحفظين",
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Screen(mohafez, "بيانات المحفظين")));
              }),
          DrawerButton(
              Icon(
                Icons.people_alt_outlined,
                color: Colors.black,
                size: 30,
              ),
              "بيانات الطلاب",
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Screen(students, "بيانات الطلاب")));
              }),
          DrawerButton(
              ImageIcon(
                AssetImage("images/group.png"),
                color: Colors.black,
                size: 30,
              ),
              "الحلقات القرانية",
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Screen(chains, "الحلقات القرانية")));
              }),
          DrawerButton(
              ImageIcon(
                AssetImage("images/question.jpg"),
                color: Colors.black,
                size: 30,
              ),
              "اختبار الاجزاء",
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Screen(exams, "اختبار الاجزاء")));
              }),
          DrawerButton(
              Icon(
                Icons.check,
                color: Colors.black,
                size: 30,
              ),
              "حضور المحفظين",
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Screen(coming, "حضور المحفظين")));
              }),
          DrawerButton(
              ImageIcon(
                AssetImage("images/cup.png"),
                color: Colors.black,
                size: 30,
              ),
              "اصدار تقارير",
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>ReportAdding(Moshref(),DrawerApp())));
              }),
          DrawerButton(
              ImageIcon(
                AssetImage("images/sheet.png"),
                color: Colors.black,
                size: 30,
              ),
              "الحفظ اليومي",
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Hefth()));
              }),
          DrawerButton(
              Icon(
                Icons.save,
                color: Colors.black,
                size: 30,
              ),
              "سجل الحفاظ",
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>History()));
              }),
          DrawerButton(
              Icon(
                Icons.question_answer,
                color: Colors.black,
                size: 30,
              ),
              "انشاء مراسلة",
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Message(Moshref(),DrawerApp())));
              }),
          DrawerButton(
              ImageIcon(
                AssetImage("images/sheet.png"),
                color: Colors.black,
                size: 30,
              ),
              "بياناتي",
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>MyData()));
              }),
          Consumer<ProviderMasjed>(
            builder:(context,ProviderMasjed,x)=> DrawerButton(
                Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                "تسجيل خروج", () {
                  ProviderMasjed.logOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Login()));
            }),
          ),
        ],
      ),
    );
  }
}
