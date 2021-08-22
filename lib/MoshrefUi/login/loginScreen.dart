import 'package:flutter/material.dart';
import 'package:masjed/MohafethUi/Mohafeth/mohafeth.dart';
import 'package:masjed/StudentUi/student/student.dart';
import 'package:masjed/bottomBar.dart';
import 'package:masjed/MoshrefUi/login/textField.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';

import '../../launch.dart';
import '../../main.dart';
class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}
BuildContext loginCon;
class _LoginState extends State<Login> {
  TextEditingController userController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    loginCon=context;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: ListView(
          children: [
            GestureDetector(child: Hero(tag: "imageTag", child: Image(
              image: AssetImage("images/logo.png")
              ,height: 300,
              width: 300,
            ))),
            Center(child: Text("تسجيل دخول",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold,),)),
            TextFieldShape("اسم المستخدم", userController,Icon(Icons.person,color: Colors.grey,size: 30,),TextInputType.emailAddress,false),
            TextFieldShape("كلمة السر", passwordController,Icon(Icons.lock,color: Colors.grey,size: 30,),TextInputType.visiblePassword,true),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 80),
              child: ElevatedButton(
                onPressed: (){
                  if(userController.text.toString()=="Moshref"&&passwordController.text.toString()=="Moshref"){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Moshref()));
                  }else if(userController.text.toString()=="Mohafeth"&&passwordController.text.toString()=="Mohafeth"){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Mohafeth()));
                  }else if(userController.text.toString()=="Student"&&passwordController.text.toString()=="Student"){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>Student()));
                  }
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text("دخول",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("عن المركز",style: TextStyle(fontSize: 25,color: Colors.black,),),
                Icon(Icons.info,color: Colors.black,size: 30,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("تواصل معنا",style: TextStyle(fontSize: 25,color: Colors.black,),),
                IconButton(onPressed: (){
                  UrlLauncher.urlLuncher.openFacebook();
                }, icon:Icon(Icons.facebook_rounded,color: Colors.black,size: 30,),),
                IconButton(onPressed: (){
                  UrlLauncher.urlLuncher.sendPhone();
                }, icon:Icon(Icons.ad_units,color: Colors.black,size: 30,),)
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar:  BottomBar(),
    );
  }
}
