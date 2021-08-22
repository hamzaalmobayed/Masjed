import 'package:flutter/material.dart';
import 'package:masjed/appBar.dart';
import 'package:masjed/generalBottomBar.dart';
import 'package:masjed/nameData.dart';
import 'package:provider/provider.dart';
import '../../../../bottomBar.dart';
import '../../provider.dart';
import '../drawer/drawer.dart';
import '../myData/dataPlace.dart';
import '../../main.dart';

class ExamSuccessAdding extends StatefulWidget {
  Widget widget;
  Widget drawer;
  ExamSuccessAdding(this.widget,this.drawer);

  @override
  _ExamSuccessAddingState createState() => _ExamSuccessAddingState();
}

class _ExamSuccessAddingState extends State<ExamSuccessAdding> {
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

    );
  }

  /*************appBar**********/
  Widget appBar() {
    return AppBarCustom(
      "ارشيف الاختبارات",
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
    return Consumer<ProviderMasjed>(
      builder: (con,ProviderMasjed,x)=> SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: ElevatedButton(
                  onPressed: (){
                    ProviderMasjed.createPDF();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(mainColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text("اصدار شهادة",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
