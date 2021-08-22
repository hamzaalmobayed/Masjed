import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/moshref/Moshref.dart';
import 'package:masjed/bottomBar.dart';
import 'package:masjed/provider.dart';
import 'package:provider/provider.dart';

import 'MoshrefUi/login/loginScreen.dart';
import 'helpers/dbHelper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DbHelper.dbHelper.initDataBase();
  runApp(ChangeNotifierProvider<ProviderMasjed>(
    create: (context)=>ProviderMasjed(),
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child,
          );
        },
        theme: ThemeData(
          fontFamily: "Cairo",

        ),
        home: FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return Center(child:Text("error"));
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return Splash();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return CircularProgressIndicator();
          },
        )
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

Color mainColor = Color.fromRGBO(220, 151, 33, 1);

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) {
              Widget x;
              return Consumer<ProviderMasjed>(
                builder: (context,ProviderMasjed,x){
                  if (ProviderMasjed.user() != null) {
                    x= Moshref();
                  } else {
                    x= Login();
                  }
                  return x;
                },
              );

            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            child: Hero(
                tag: "imageTag",
                child: Image(
                    image: AssetImage("images/logo.png")
                  ,height: 500,
                  width: 500,
                )
            )),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
