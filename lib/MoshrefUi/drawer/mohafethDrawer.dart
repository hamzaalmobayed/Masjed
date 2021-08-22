

import 'package:flutter/material.dart';
import 'package:masjed/MohafethUi/Mohafeth/mohafeth.dart';
import 'package:masjed/MohafethUi/dataExport/dataExport.dart';
import 'package:masjed/MohafethUi/mohafethData/mohafethData.dart';
import 'package:masjed/MohafethUi/studentDataProccess/studentData.dart';
import 'package:masjed/MohafethUi/studentExam/studentExam.dart';
import 'package:masjed/MoshrefUi/DailyHefthShow/dailyHefthShow.dart';
import 'package:masjed/MoshrefUi/dailyhefth/hefth.dart';
import 'package:masjed/MoshrefUi/login/loginScreen.dart';
import 'package:masjed/MoshrefUi/messaging/message.dart';
import 'package:masjed/MoshrefUi/mohafethSuccessAdding/mohafethSuccessAdding.dart';
import 'package:masjed/MoshrefUi/myData/myData.dart';
import 'package:masjed/MoshrefUi/reportAdding/reportAdding.dart';
import 'package:masjed/appBar.dart';

import 'drawerButton.dart';

class MohafethDrawer extends StatelessWidget {
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
              "بيانات الطلاب",
                  () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>StudentData()));
                  }),
          DrawerButton(
              ImageIcon(
                AssetImage("images/sheet.png"),
                color: Colors.black,
                size: 30,
              ),
              "التحفيظ اليومي",
                  () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>DailyHefthShow(Mohafeth(),MohafethDrawer())));
              }),
          DrawerButton(
              Icon(Icons.card_giftcard,
                color: Colors.black,
                size: 30,),
              "ارشيف الاختبارات",
                  () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>StudentExam()));
              }),
          DrawerButton(
              ImageIcon(
                AssetImage("images/cup.png"),
                color: Colors.black,
                size: 30,
              ),
              "التقارير و الانجازات",
                  () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>ReportAdding(Mohafeth(),MohafethDrawer())));
                  }),
          DrawerButton(
              ImageIcon(
                AssetImage("images/sheet.png"),
                color: Colors.black,
                size: 30,
              ),
              "تصدير البيانات",
                  () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>DataExport()));
              }),
          DrawerButton(
              Icon(Icons.image_search,
                color: Colors.black,
                size: 30,),
              "ارشيف الحفظ",
                  () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>StudentExam()));
              }),
          DrawerButton(
              Icon(
                Icons.question_answer,
                color: Colors.black,
                size: 30,
              ),
              "انشاء مراسلة",
                  () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Message(Mohafeth(),MohafethDrawer())));
              }),
          DrawerButton(
              ImageIcon(
                AssetImage("images/sheet.png"),
                color: Colors.black,
                size: 30,
              ),
              "بياناتي",
                  () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>MohafethData()));
              }),
          DrawerButton(
              Icon(
                Icons.logout_outlined,
                color: Colors.black,
                size: 30,
              ),
              "تسجيل خروج", () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Login()));
          }),
        ],
      ),
    );
  }
}
