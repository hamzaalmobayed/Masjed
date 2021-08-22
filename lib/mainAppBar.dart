import 'package:flutter/material.dart';

import 'main.dart';
GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
class MainAppBar extends StatelessWidget {

int notificationCount;

MainAppBar(this.notificationCount);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: mainColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text("الصفحة الرئيسية",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      actions: [
        Column(
          children: [
            SizedBox(height: 6,),
            Stack(
              children: [
                IconButton(icon:Icon(Icons.notifications,color: Colors.white,size: 30,)),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                    alignment: Alignment.center,
                    child: Text('$notificationCount'),
                  ),
                )
              ],
            ),
          ],
        ),
        IconButton(icon: ImageIcon(AssetImage("images/list.jpg"),color: Colors.white,size: 30,),onPressed: (){
          scaffoldKey.currentState.openEndDrawer();
        },),
        SizedBox(width: 10,)
      ],
    );
  }
}
