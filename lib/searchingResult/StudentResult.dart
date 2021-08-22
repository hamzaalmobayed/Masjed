import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masjed/appBar.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/generalBottomBar.dart';
import 'package:masjed/main.dart';
import 'package:masjed/MoshrefUi/myData/dataPlace.dart';
import 'package:masjed/nameData.dart';
import 'package:masjed/provider.dart';
import 'package:provider/provider.dart';
import '../../bottomBar.dart';
class StudentResult extends StatefulWidget {
  Widget widget;
  Widget drawer;


  StudentResult(this.widget,this.drawer);

  @override
  _StudentResultState createState() => _StudentResultState();
}

class _StudentResultState extends State<StudentResult> {
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
      endDrawer: widget.drawer,
      endDrawerEnableOpenDragGesture: false,
      bottomNavigationBar: GeneralBottomBar(widget.widget),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: floatingButton(),
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
              enable=!enable;
              read=!read;
            });
          },
          child: Icon(Icons.edit,color: Colors.white,size: 30,),
        ),
      ),
    );
  }
  /*************body**********/
  Widget body(){
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('students').snapshots();
    return Consumer<ProviderMasjed>(
      builder:(context,ProviderMasjed,x)=> SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:20.0,left: 10,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NameInAddingData(Icon(Icons.account_circle_outlined,size: 100,color: Colors.black,), read, enable, "اسم الطالب", ProviderMasjed.studentNameCon.text,con1),
              SizedBox(height: 20,),
              DataPlace("رقم الهوية", con1, ProviderMasjed.studentCardCon.text, read, enable),
              DataPlace("تاريخ الميلاد", con1, ProviderMasjed.studentBirthdayCon.text, read, enable),
              DataPlace("الصف المدرسي", con1, ProviderMasjed.studentClassCon.text, read, enable),
              DataPlace("رقم الجوال", con1, ProviderMasjed.studentMobileCon.text, read, enable),
              DataPlace("اسم الحلقة", con1, "", read, enable),
              DataPlace("حالة الاسرة", con1, ProviderMasjed.studentStatus, read, enable),
              DataPlace("اخر دورة احكام", con1, ProviderMasjed.studentCourse, read, enable),
              DataPlace("عنوان السكن", con1, ProviderMasjed.studentAddressCon.text, read, enable),
              DataPlace("عمل الاب", con1, ProviderMasjed.studentFatherWorkCon.text, read, enable),
              DataPlace("رقم هوية الاب", con1,ProviderMasjed.studentFatherCardCon.text, read, enable),
              DataPlace("كلمة المرور", con1,  ProviderMasjed.studentPasswordCon.text, read, enable),


            ],
          ),
        ),
      ),
    );
  }

}
