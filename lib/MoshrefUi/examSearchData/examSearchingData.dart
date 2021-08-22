import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/examSearchData/examResult.dart';
import 'package:masjed/MoshrefUi/examSearching/examSearching.dart';
import 'package:masjed/MoshrefUi/examSuccessAdding/examSuccessAdding.dart';
import 'package:masjed/generalBottomBar.dart';
import '../../appBar.dart';
import '../../bottomBar.dart';
import '../../main.dart';
import '../../nameData.dart';
class ExamSearchingData extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext cont;
  TextEditingController con=TextEditingController();
  @override
  Widget build(BuildContext context) {
    cont=context;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBar(),
      ),
      body: body(),
      endDrawer: DrawerApp(),
      endDrawerEnableOpenDragGesture: false,
      bottomNavigationBar: GeneralBottomBar(ExamSearching()),

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

  /*************body**********/
  Widget body(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            NameInAddingData(Text(""), false, true, "اسم الطالب","",con),
            SizedBox(height: 20,),
            ExamResult("م.", "تاريخ الاختبار", "الجزء المختبر","العلامة", Colors.white,mainColor,(){}),
            ExamResult("1", "2/8/2021", "تبارك","98%",mainColor, Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamSearchingData(),DrawerApp())));
            }),
            ExamResult("1", "2/8/2021", "تبارك","98%",mainColor, Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamSearchingData(),DrawerApp())));
            }),
            ExamResult("1", "2/8/2021", "تبارك","98%",mainColor, Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamSearchingData(),DrawerApp())));
            }),
            ExamResult("1", "2/8/2021", "تبارك","98%",mainColor, Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamSearchingData(),DrawerApp())));
            }),
            ExamResult("1", "2/8/2021", "تبارك","98%",mainColor, Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamSearchingData(),DrawerApp())));
            }),
            ExamResult("1", "2/8/2021", "تبارك","98%",mainColor, Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamSearchingData(),DrawerApp())));
            }),
            ExamResult("1", "2/8/2021", "تبارك","98%",mainColor, Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamSearchingData(),DrawerApp())));
            }),
            ExamResult("1", "2/8/2021", "تبارك","98%",mainColor, Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamSearchingData(),DrawerApp())));
            }),
            ExamResult("1", "2/8/2021", "تبارك","98%",mainColor, Colors.white,(){
              Navigator.of(cont).pushReplacement(
                  MaterialPageRoute(
                      builder: (con) => ExamSuccessAdding(ExamSearchingData(),DrawerApp())));
            }),


          ],
        ),
      ),
    );
  }
}
