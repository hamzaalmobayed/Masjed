import 'package:flutter/material.dart';
import 'package:masjed/appBar.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/generalBottomBar.dart';
import 'package:masjed/main.dart';
import 'package:masjed/MoshrefUi/myData/dataPlace.dart';
import 'package:masjed/nameData.dart';
import 'package:masjed/MoshrefUi/reportAdding/beginEngHefth.dart';

import '../../bottomBar.dart';
class ReportAdding extends StatefulWidget {
  Widget widget;
  Widget drawer;
  ReportAdding(this.widget,this.drawer);

  @override
  _ReportAddingState createState() => _ReportAddingState();
}

class _ReportAddingState extends State<ReportAdding> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController con=TextEditingController();
  bool enable=true;

  bool read=false;
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

    );
  }

  /*************appBar**********/
  Widget appBar() {
    return AppBarCustom(
      "تقرير حفظ الطالب",
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
            NameInAddingData(Icon(Icons.account_circle_outlined,size: 100,color: Colors.black,), read, enable, "اسم المحفظ", "عمار راشد براء اسليم",con),
            SizedBox(height: 20,),
            DataPlace("تاريخ بداية التقرير", con1, "1/8/1999", read, enable),
            DataPlace("تاريخ نهاية التقرير", con1, "1/8/1999", read, enable),
            BeginEngHefth("بداية الحفظ", "اية", "سورة", con, con,"", read, enable),
            BeginEngHefth("بداية الحفظ", "اية", "سورة", con,con, "", read, enable),
            DataPlace(" عدد صفحات الحفظ", con1, "25 صفحة", read, enable),
            DataPlace("عدد صفحات المراجعة", con1, "25 صفحة", read, enable),
            DataPlace("عدد ايام الحضور", con1, "5", read, enable),
            DataPlace("التقييم العام", con1, "ممتاز", read, enable),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mainColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                  child: Text("تصدير",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
