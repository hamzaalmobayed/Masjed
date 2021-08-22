import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masjed/MohafethUi/studentDataProccess/studentData.dart';
import 'package:masjed/MoshrefUi/chainSuccessAdding/chainSuccessAdding.dart';
import 'package:masjed/MoshrefUi/dataProcessScreen/screen.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/mohafethSuccessAdding/mohafethSuccessAdding.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/MoshrefUi/report/reportFieldShape.dart';
import 'package:masjed/MoshrefUi/searching/searchingShape.dart';
import 'package:masjed/MoshrefUi/studentSuccessAdding/StudentSuccessAdding.dart';
import 'package:masjed/provider.dart';
import 'package:provider/provider.dart';

import '../../appBar.dart';
import '../../bottomBar.dart';
import '../../lists.dart';
import '../../main.dart';
class Searching extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String txt;
  Widget drawer;
  Searching(this.txt,this.drawer);

BuildContext context;
  @override
  Widget build(BuildContext cont) {
    context=cont;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBar(),
      ),
      endDrawer: drawer,
      endDrawerEnableOpenDragGesture: false,
      body: body(),
      bottomNavigationBar: bottomBar(),
    );
  }
  /*************appBar**********/
  Widget appBar() {
    return AppBarCustom(
      "",
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
  /*************bottomBar**********/
  Widget bottomBar(){
    return Builder(
      builder:(context)=> Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_forward),
                color: Colors.black,
                iconSize: 30,
                onPressed: () {
                  if(txt=="ادخل اسم المحفظ"){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Screen(mohafez, "بيانات المحفظين")));
                  }else if(txt=="ادخل اسم الطالب"){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Screen(students, "بيانات الطلاب")));
                  }else if(txt=="ادخل اسم الحلقة"){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Screen(chains, "الحلقات القرانية")));
                  }else if(txt=="ادخل اسم طالب"){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>StudentData()));
                  }

                }
              ),
            ],
          ),
          BottomBar()
        ],
      ),
    );
  }

  Widget body(){
    return Consumer<ProviderMasjed>(
      builder:(context,ProviderMasjed,x)=> Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 314,
                  height: 200,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 10.0,
                        ),
                      ],
                      color:mainColor,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SearchingShape(txt, ProviderMasjed.searchingCon),
                    ],
                  ) ,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 80),
                  child: ElevatedButton(
                    onPressed: (){
                      if(txt=="ادخل اسم المحفظ"){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>MohafethSuccessAdding(Searching(txt,drawer),drawer)));
                      }else if(txt=="ادخل اسم الطالب"){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>StudentSuccessAdding(Searching(txt,drawer),drawer)));
                      }else if(txt=="ادخل اسم الحلقة"){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>ChainSuccessAdding(Searching(txt,drawer),drawer)));
                      }

                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(width: 2,color: mainColor),
                              borderRadius: BorderRadius.circular(50.0),
                            )
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("تم",style: TextStyle(fontSize: 20,color: mainColor,fontWeight: FontWeight.bold,),),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
