import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/dataProcessScreen/screen.dart';
import 'package:masjed/appBar.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/firebase/storage.dart';
import 'package:masjed/generalBottomBar.dart';
import 'package:masjed/main.dart';
import 'package:masjed/MoshrefUi/mohafethAdding/dropDownButtonAdding.dart';
import 'package:masjed/MoshrefUi/mohafethAdding/textFieldAdding.dart';
import 'package:masjed/MoshrefUi/mohafethSuccessAdding/mohafethSuccessAdding.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/model/MohafethModel.dart';
import 'package:masjed/nameData.dart';
import 'package:masjed/searchingResult/mohafethResult.dart';
import 'package:provider/provider.dart';

import '../../bottomBar.dart';
import '../../lists.dart';
import '../../provider.dart';
class MohafethAdding extends StatefulWidget {
  @override
  _MohafethAddingState createState() => _MohafethAddingState();
}

class _MohafethAddingState extends State<MohafethAdding> {
  TextEditingController con=TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool enable=true;

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
      endDrawer: DrawerApp(),
      endDrawerEnableOpenDragGesture: false,
      bottomNavigationBar: GeneralBottomBar(Screen(mohafez, "بيانات المحفظين")),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: floatingButton(),
    );
  }

  /*************appBar**********/
  Widget appBar() {
    return AppBarCustom(
      "اضافة محفظ",
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
      builder:(context,ProviderMasjed,x) =>Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 35,
          child: FloatingActionButton(
            backgroundColor: mainColor,
            onPressed: (){
              ProviderMasjed.registerMohafeth();

              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>MohafethResult(MohafethAdding(),DrawerApp())));
            },
            child: Icon(Icons.add,color: Colors.white,size: 30,),
          ),
        ),
      ),
    );
  }
  /*************body**********/
  Widget body(){
    return Consumer<ProviderMasjed>(
      builder:(context,ProviderMasjed,x)=> SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:20.0,left: 10,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NameInAddingData(Icon(Icons.account_circle_outlined,size: 100,color: Colors.black,), read, enable, "اسم المحفظ", "",ProviderMasjed.mohafethNameCon),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    TextFieldAdding("رقم الهوية", ProviderMasjed.mohafethCardCon),
                    TextFieldAdding("تاريخ الميلاد", ProviderMasjed.mohafethBirthdayCon),
                    TextFieldAdding("التخصص الاكاديمي", ProviderMasjed.mohafethFeildCon),
                    TextFieldAdding("رقم الجوال", ProviderMasjed.mohafethMobileCon),
                    DropDownButtonAdding(ProviderMasjed.mohafethStatus, ProviderMasjed.mohafethStatusList),
                    TextFieldAdding("كلمة المرور", ProviderMasjed.mohafethPasswordCon),
                    DropDownButtonAdding(ProviderMasjed.mohafethCourse,ProviderMasjed.mohafethCourseList),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
