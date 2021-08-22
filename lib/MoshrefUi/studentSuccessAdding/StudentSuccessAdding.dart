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
class StudentSuccessAdding extends StatefulWidget {
  Widget widget;
  Widget drawer;


  StudentSuccessAdding(this.widget,this.drawer);

  @override
  _StudentSuccessAddingState createState() => _StudentSuccessAddingState();
}

class _StudentSuccessAddingState extends State<StudentSuccessAdding> {
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
              StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  int count=0;
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                    return Column(
                      children: snapshot.data.docs.where((element) => false).map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                        String name=data["studentName"];
                        if(name.contains(ProviderMasjed.searchingCon.text)){
                          return Column(
                            children: [
                              NameInAddingData(Icon(Icons.account_circle_outlined,size: 100,color: Colors.black,), read, enable, "اسم الطالب", data["studentName"],con1),
                              SizedBox(height: 20,),
                              DataPlace("رقم الهوية", con1, data["studentCard"], read, enable),
                              DataPlace("تاريخ الميلاد", con1, data["birthDate"], read, enable),
                              DataPlace("الصف المدرسي", con1, data["classRoom"], read, enable),
                              DataPlace("رقم الجوال", con1, data["mobile"], read, enable),
                              DataPlace("اسم الحلقة", con1, data["chainName"], read, enable),
                              DataPlace("حالة الاسرة", con1, data["familyStatus"], read, enable),
                              DataPlace("اخر دورة احكام", con1, data["course"], read, enable),
                              DataPlace("عنوان السكن", con1, data["address"], read, enable),
                              DataPlace("عمل الاب", con1, data["fatherWork"], read, enable),
                              DataPlace("رقم هوية الاب", con1, data["fatherIdCard"], read, enable),
                              DataPlace("كلمة المرور", con1,  data["password"], read, enable),
                            ],
                          );

                        }else{
                          return Center(
                            child: Text("لا يوجد نتائج"),
                          );
                        }

                      }).toList(),
                    );



                },
              ),


            ],
          ),
        ),
      ),
    );
  }

}
