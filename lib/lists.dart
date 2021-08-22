import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/firebase/storage.dart';
import 'package:masjed/provider.dart';
import 'package:provider/provider.dart';
import 'MoshrefUi/addingChain/addingChain.dart';
import 'MoshrefUi/chainDataShow/chainDataShow.dart';
import 'MoshrefUi/comingAdd/comingAdd.dart';
import 'MoshrefUi/comingDataShow/comingDataShow.dart';
import 'MoshrefUi/dataProcessScreen/ProcessButton.dart';
import 'MoshrefUi/dataProcessScreen/screen.dart';
import 'MoshrefUi/examAdding/beginOfPage.dart';
import 'MoshrefUi/examAdding/examAdding.dart';
import 'MoshrefUi/examDataShow/examDataShow.dart';
import 'MoshrefUi/examSearching/examSearching.dart';
import 'MoshrefUi/mohafethAdding/mohafethAdding.dart';
import 'MoshrefUi/mohafethDataShow/mohafethDataShow.dart';
import 'MoshrefUi/mohafethSearching/mohafethSearching.dart';
import 'MoshrefUi/searching/searching.dart';
import 'MoshrefUi/studentAdding/studentAfdding.dart';
import 'MoshrefUi/studentDataShow/studentDataShow.dart';



List<Widget> mohafez = [
  ProcessButton(
      Icon(
        Icons.person_add,
        color: Colors.black,
        size: 30,
      ),
      "اضافة محفظ جديد",
      () {
        Navigator.of(cont).push(MaterialPageRoute(builder: (con)=>MohafethAdding()));
      }),
  ProcessButton(
      Icon(
        Icons.search,
        color: Colors.black,
        size: 30,
      ),
      "البحث عن بيانات المحفظ",
      () {
        print("ok");
        Navigator.of(cont).push(MaterialPageRoute(builder: (con)=>Searching("ادخل اسم المحفظ",DrawerApp())));
      }),
  ProcessButton(
      Icon(
        Icons.remove_red_eye,
        color: Colors.black,
        size: 30,
      ),
      "عرض كافة المحفظين",
      () {
        Navigator.of(cont).pushReplacement(
            MaterialPageRoute(
                builder: (con) =>MohafethDataShow()));
      }),
  Consumer<ProviderMasjed>(
      builder: (con,ProviderMasjed,x){
        return ProcessButton(
            Icon(
              Icons.assessment,
              color: Colors.black,
              size: 30,
            ),
            "تصدير بيانات المحفظين",
                () {
              ProviderMasjed.createExcelMohafeth();
            });
      }
  )

];
List<Widget> students = [
  ProcessButton(
      Icon(
        Icons.person_add,
        color: Colors.black,
        size: 30,
      ),
      "اضافة طالب جديد",
      () {
        Navigator.of(cont).pushReplacement(MaterialPageRoute(builder: (con)=>StudentAdding()));
      }),
  ProcessButton(
      Icon(
        Icons.search,
        color: Colors.black,
        size: 30,
      ),
      "البحث عن بيانات الطلاب",
      () {
        Navigator.of(cont).pushReplacement(MaterialPageRoute(builder: (con)=>Searching("ادخل اسم الطالب",DrawerApp())));
      }),
  ProcessButton(
      Icon(
        Icons.remove_red_eye,
        color: Colors.black,
        size: 30,
      ),
      "عرض كافة الطلاب",
      () {
        Navigator.of(cont).pushReplacement(
            MaterialPageRoute(
                builder: (con) =>StudentDataShow(Screen(mohafez, "بيانات المحفظين"),DrawerApp())));
      }),
  Consumer<ProviderMasjed>(
      builder: (con,ProviderMasjed,x)=> ProcessButton(
        Icon(
          Icons.assessment,
          color: Colors.black,
          size: 30,
        ),
        "تصدير بيانات الطلاب",
        () {
          ProviderMasjed.createExcelStudent();
        }),
  ),
];
List<Widget> chains = [
  ProcessButton(
      Icon(
        Icons.person_add,
        color: Colors.black,
        size: 30,
      ),
      "اضافة حلقة جديدة",
      () {
        Navigator.of(cont).pushReplacement(MaterialPageRoute(builder: (con)=>ChainAdding()));

      }),
  ProcessButton(
      Icon(
        Icons.search,
        color: Colors.black,
        size: 30,
      ),
      "البحث عن بيانات حلقة",
      () {
        Navigator.of(cont).pushReplacement(MaterialPageRoute(builder: (con)=>Searching("ادخل اسم الحلقة",DrawerApp())));
      }),
  ProcessButton(
      Icon(
        Icons.remove_red_eye,
        color: Colors.black,
        size: 30,
      ),
      "عرض كافة الحلقات",
      () {
        Navigator.of(cont).pushReplacement(
            MaterialPageRoute(
                builder: (con) =>ChainDataShow()));
      }),
  Consumer<ProviderMasjed>(
    builder: (con,ProviderMasjed,x)=> ProcessButton(
        Icon(
          Icons.assessment,
          color: Colors.black,
          size: 30,
        ),
        "تصدير بيانات الحلقات",
            () {
          ProviderMasjed.createExcelChain();
        }),
  ),
];
List<Widget> exams = [
  Consumer<ProviderMasjed>(
    builder: (context,ProviderMasjed,x)=>ProcessButton(
        Icon(
          Icons.person_add,
          color: Colors.black,
          size: 30,
        ),
        "اضافة اختبار جديد",
        () {

          Navigator.of(cont).push(MaterialPageRoute(builder: (con)=>ExamAdding()));

        }),
  ),
  ProcessButton(
      Icon(
        Icons.search,
        color: Colors.black,
        size: 30,
      ),
      "البحث عن اختبارات طلاب",
      () {
        Navigator.of(cont).pushReplacement(MaterialPageRoute(builder: (con)=>ExamSearching()));

      }),
  ProcessButton(
      Icon(
        Icons.remove_red_eye,
        color: Colors.black,
        size: 30,
      ),
      "عرض ارشيف الاختبارات",
      () {
        Navigator.of(cont).pushReplacement(
            MaterialPageRoute(
                builder: (con) =>ExamDataShow()));
      }),
  Consumer<ProviderMasjed>(
    builder: (con,ProviderMasjed,x)=> ProcessButton(
        Icon(
          Icons.assessment,
          color: Colors.black,
          size: 30,
        ),
        "تصدير بيانات الاختبارات",
            () {
          ProviderMasjed.createExcelExam();
        }),
  ),
];
List<Widget> coming = [
  ProcessButton(
      Icon(
        Icons.person_add,
        color: Colors.black,
        size: 30,
      ),
      "ادخال الحضور اليومي",
      () {
        Navigator.of(cont).push(MaterialPageRoute(builder: (con)=>ComingAdd()));

      }),
  ProcessButton(
      Icon(
        Icons.search,
        color: Colors.black,
        size: 30,
      ),
      "البحث عن سجل محفظ",
      () {
        Navigator.of(cont).pushReplacement(MaterialPageRoute(builder: (con)=>MohafethSearching()));
      }),
  ProcessButton(
      Icon(
        Icons.remove_red_eye,
        color: Colors.black,
        size: 30,
      ),
      "عرض الارشيف اليومي",
      () {
        Navigator.of(cont).pushReplacement(
            MaterialPageRoute(
                builder: (con) =>ComingDataShow()));
      }),
  Consumer<ProviderMasjed>(
    builder: (con,ProviderMasjed,x)=> ProcessButton(
        Icon(
          Icons.assessment,
          color: Colors.black,
          size: 30,
        ),
        "تصدير بيانات الحضور",
            () {
          ProviderMasjed.createExcelComing();
        }),
  ),
];
