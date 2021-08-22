import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/drawer/drawer.dart';
import 'package:masjed/MoshrefUi/history/historyShape.dart';
import 'package:masjed/MoshrefUi/mohafethSearching/mohafethSearching.dart';
import 'package:masjed/generalBottomBar.dart';
import '../../appBar.dart';
import '../../bottomBar.dart';
import '../../main.dart';
import '../../nameData.dart';
class ComingSuccessAdding extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
TextEditingController con=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBar(),
      ),
      body: body(),
      endDrawer: DrawerApp(),
      endDrawerEnableOpenDragGesture: false,
      bottomNavigationBar: GeneralBottomBar(MohafethSearching()),

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
  Widget body(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            NameInAddingData(Text(""), false, true, "اسم المحفظ","",con),
            SizedBox(height: 20,),
            HistoryShape("م.", "التاريخ", "الحالة", Colors.white,mainColor,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),
            HistoryShape("1", "12/8/2021", "حاضر", Colors.black,Colors.white,(){}),

          ],
        ),
      ),
    );
  }
}
