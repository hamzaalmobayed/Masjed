import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/myData/dataPlace.dart';
import 'package:masjed/MoshrefUi/reportAdding/beginEngHefth.dart';
import 'package:masjed/appBar.dart';
import 'package:masjed/generalBottomBar.dart';
import 'package:masjed/main.dart';
import 'package:masjed/model/HefthModel.dart';
import 'package:masjed/nameData.dart';
import 'package:provider/provider.dart';

import '../../bottomBar.dart';
import '../../provider.dart';
class DailyHefthShow extends StatefulWidget {
  Widget widget;
  Widget drawer;
  DailyHefthShow(this.widget,this.drawer);

  @override
  _DailyHefthShowState createState() => _DailyHefthShowState();
}

class _DailyHefthShowState extends State<DailyHefthShow> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool enable=true;
  TextEditingController con=TextEditingController();
  bool read=false;
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
    return Consumer<ProviderMasjed>(
      builder: (context,ProviderMasjed,x)=>SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:20.0,left: 10,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NameInAddingData(Icon(Icons.account_circle_outlined,size: 100,color: Colors.black,), read, enable, "اسم الطالب", "عمار راشد براء اسليم",con),
              NameInAddingData(Text(""), read, enable, "اسم الحلقة", "عمار راشد براء اسليم",con),
              SizedBox(height: 20,),
              BeginEngHefth("بداية الحفظ", "اية", "سورة", ProviderMasjed.conBeginAya,ProviderMasjed.conBeginSora, "", read, enable),
              BeginEngHefth("نهاية الحفظ", "اية", "سورة", ProviderMasjed.conEndAya,ProviderMasjed.conEndSora, "", read, enable),
              DataPlace(" عدد صفحات الحفظ", ProviderMasjed.conPageNumber, "25 صفحة", read, enable),
              DataPlace("عدد صفحات المراجعة", ProviderMasjed.conRevisionPage, "25 صفحة", read, enable),
              DataPlace("التقييم العام", ProviderMasjed.conEstimate, "ممتاز", read, enable),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: ElevatedButton(
                  onPressed: ()async {
                    ProviderMasjed.insertReport();

                  },
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
                    child: Text("تم",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),),
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
