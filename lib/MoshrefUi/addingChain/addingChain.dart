import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/chainSuccessAdding/chainSuccessAdding.dart';
import 'package:masjed/MoshrefUi/dataProcessScreen/screen.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/mohafethAdding/dropDownButtonAdding.dart';
import 'package:masjed/MoshrefUi/mohafethAdding/textFieldAdding.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/appBar.dart';
import 'package:masjed/generalBottomBar.dart';
import 'package:masjed/main.dart';
import 'package:masjed/nameData.dart';
import 'package:masjed/provider.dart';
import 'package:provider/provider.dart';

import '../../bottomBar.dart';
import '../../lists.dart';
class ChainAdding extends StatefulWidget {
  @override
  _ChainAddingState createState() => _ChainAddingState();
}

class _ChainAddingState extends State<ChainAdding> {
  TextEditingController con=TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
      endDrawer: DrawerApp(),
      endDrawerEnableOpenDragGesture: false,
      bottomNavigationBar: GeneralBottomBar(Screen(students, "بيانات الطلاب")),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: floatingButton(),
    );
  }

  /*************appBar**********/
  Widget appBar() {
    return AppBarCustom(
      "اضافة حلقة",
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
    return Consumer<ProviderMasjed>(
      builder:(context,ProviderMasjed,x)=> Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 35,
          child: FloatingActionButton(
            backgroundColor: mainColor,
            onPressed: (){

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (con) => ChainSuccessAdding(ChainAdding(),DrawerApp())));
            },
            child: Icon(Icons.add,color: Colors.white,size: 30,),
          ),
        ),
      ),
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
            NameInAddingData(ImageIcon(AssetImage("images/group.png"), color: Colors.black, size: 100), read, enable, "اسم الحلقة", "",con),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  DropDownButtonAdding("محفظ الحلقة", ["محفظ الحلقة"]),
                  DropDownButtonAdding("مساعد الحلقة", ["مساعد الحلقة"]),
                  DropDownButtonAdding("الفئة العمرية", ["الفئة العمرية"]),
                  TextFieldAdding("رقم الحلقة", con),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
