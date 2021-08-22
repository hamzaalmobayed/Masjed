import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/drawer/studentDrawer.dart';
import 'package:masjed/appBar.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/generalBottomBar.dart';
import 'package:masjed/main.dart';
import 'package:masjed/MoshrefUi/myData/dataPlace.dart';
import 'package:masjed/nameData.dart';
import '../../bottomBar.dart';
class StudentDataShowScreen extends StatefulWidget {
  Widget widget;

  StudentDataShowScreen(this.widget);

  @override
  _StudentDataShowScreenState createState() => _StudentDataShowScreenState();
}

class _StudentDataShowScreenState extends State<StudentDataShowScreen> {
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
      "بيانات الطالب",
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
            DataPlace("رقم الهوية", con1, "405203126", read, enable),
            DataPlace("تاريخ الميلاد", con1, "1/8/1999", read, enable),
            DataPlace("الصف المدرسي", con1, "السابع", read, enable),
            DataPlace("رقم الجوال", con1, "0597821468", read, enable),
            DataPlace("اسم الحلقة", con1, "ابو بكر الصديق", read, enable),
            DataPlace("حالة الاسرة", con1, "متوسطة", read, enable),
            DataPlace("اخر دورة احكام", con1, "عليا", read, enable),
            DataPlace("عنوان السكن", con1, "تل الهوا", read, enable),
            DataPlace("عمل الاب", con1, "مدرس", read, enable),
            DataPlace("رقم هوية الاب", con1, "254836958", read, enable),
            DataPlace("كلمة المرور", con1, "زيد بن الحارث", read, enable),

          ],
        ),
      ),
    );
  }


}
