
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:masjed/firebase/storage.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:masjed/model/HefthModel.dart';

import 'firebase/authinitication.dart';
import 'model/MohafethModel.dart';
import 'model/StudentModel.dart';
class ProviderMasjed extends ChangeNotifier{
  TextEditingController conName=TextEditingController();
  TextEditingController conBeginAya=TextEditingController();
  TextEditingController conBeginSora=TextEditingController();
  TextEditingController conEndAya=TextEditingController();
  TextEditingController conEndSora=TextEditingController();
  TextEditingController conPageNumber=TextEditingController();
  TextEditingController conRevisionPage=TextEditingController();
  TextEditingController conEstimate=TextEditingController();
  TextEditingController mohafethNameCon=TextEditingController();
  TextEditingController mohafethCardCon=TextEditingController();
  TextEditingController mohafethBirthdayCon=TextEditingController();
  TextEditingController mohafethFeildCon=TextEditingController();
  TextEditingController mohafethMobileCon=TextEditingController();
  TextEditingController mohafethPasswordCon=TextEditingController();
  TextEditingController studentNameCon=TextEditingController();
  TextEditingController studentCardCon=TextEditingController();
  TextEditingController studentBirthdayCon=TextEditingController();
  TextEditingController studentFatherCardCon=TextEditingController();
  TextEditingController studentMobileCon=TextEditingController();
  TextEditingController studentClassCon=TextEditingController();
  TextEditingController studentPasswordCon=TextEditingController();
  TextEditingController studentFatherWorkCon=TextEditingController();
  TextEditingController studentAddressCon=TextEditingController();
  TextEditingController searchingCon=TextEditingController();
  Mohafeth_model mohafeth;
  Student_model student;
  List<String> mohafethStatusList=["حالة الاسرة","فقيرة","متوسطة","غنية"];
  String mohafethStatus="حالة الاسرة";
  String studentStatus="حالة الاسرة";
  List<String> mohafethCourseList=["دورات الاحكام","تمهيدية","تاهيلية","عليا","تاهيل سند","سند متصل"];
  String mohafethCourse="دورات الاحكام";
  String studentCourse="دورات الاحكام";
  int count=0;
  String valueStudent;
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();

  change(){
    notifyListeners();
  }


  insertReport() async{
    Hefth_Model hefth=Hefth_Model(
      studentNameHefth: "conName3",
      beginAya:conBeginAya.text,
      beginSora:conBeginSora.text,
      endAya:conEndAya.text,
      endSora:conEndSora.text,
      pageNumber:conPageNumber.text,
      revisionPage:conRevisionPage.text,
      estimate:conEstimate.text,
    );
    await FireStore_Helper.FireStoreHelper.add("reports",hefth.toMap());
    print("done");
  }


  registerMohafeth() async {
    try {
      UserCredential userCredential = await Auth_Helper.authHelper
          .signup(mohafethCardCon.text,mohafethPasswordCon.text);
      mohafeth=Mohafeth_model(
        mohafethName:mohafethNameCon.text,
        mohafethIdCard:mohafethCardCon.text,
        birthDate:mohafethBirthdayCon.text,
        feild:mohafethFeildCon.text,
        mobile:mohafethMobileCon.text,
        familyStatus:mohafethStatus,
        password:mohafethPasswordCon.text,
        course:mohafethCourse,
      );
      await FireStore_Helper.FireStoreHelper.add("mohafeths",mohafeth.toMap());
      await Auth_Helper.authHelper.verifyEmail();
      await Auth_Helper.authHelper.logout();

    } on Exception catch (e) {
      // TODO
    }
// navigate to login


  }

  registerStudent() async {
    try {
      UserCredential userCredential = await Auth_Helper.authHelper
          .signup(mohafethCardCon.text,mohafethPasswordCon.text);
      student=Student_model(
        studentName:studentNameCon.text,
        studentCard: studentCardCon.text,
        birthDate: studentBirthdayCon.text,
        fatherIdCard:studentFatherCardCon.text,
        fatherWork:studentFatherWorkCon.text,
        mobile:studentMobileCon.text,
        classRoom: studentClassCon.text,
        chainName: "hi",
        familyStatus:studentStatus,
        password:studentPasswordCon.text,
        address:studentAddressCon.text,
        course: studentCourse,
      );
      await FireStore_Helper.FireStoreHelper.add("students",student.toMap());
      await Auth_Helper.authHelper.verifyEmail();
      await Auth_Helper.authHelper.logout();

    } on Exception catch (e) {
      // TODO
    }
// navigate to login


  }

  loginMohafeth() async {
    UserCredential userCredinial = await Auth_Helper.authHelper
        .signin(mohafethCardCon.text, mohafethPasswordCon.text);
    FireStore_Helper.FireStoreHelper
        .getUserFromFirestore(userCredinial.user.uid,"mohafeths");

  }

  loginStudent() async {
    UserCredential userCredinial = await Auth_Helper.authHelper
        .signin(mohafethCardCon.text, mohafethPasswordCon.text);
    FireStore_Helper.FireStoreHelper
        .getUserFromFirestore(userCredinial.user.uid,"students");

  }





  Future<void> createExcelMohafeth() async
  {
    //Create a Excel document.
    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index.
    final Worksheet sheet = workbook.worksheets[0];

    // Set the text value.
String mohafethName;

    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await FirebaseFirestore.instance.collection('mohafeths').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    List<Mohafeth_model> mohafeth =
    docs.map((e) => Mohafeth_model.fromMap(e.data())).toList();
    mohafeth.forEach((element) {
      count=count+1;
      print(element.mohafethName);
      sheet.getRangeByName('A'+count.toString()).setText(element.mohafethName);
      sheet.getRangeByName('B'+count.toString()).setText(element.mohafethIdCard);
      sheet.getRangeByName('C'+count.toString()).setText(element.birthDate);
      sheet.getRangeByName('D'+count.toString()).setText(element.feild);
      sheet.getRangeByName('E'+count.toString()).setText(element.mobile);
      sheet.getRangeByName('G'+count.toString()).setText(element.familyStatus);
      sheet.getRangeByName('H'+count.toString()).setText(element.password);
      sheet.getRangeByName('I'+count.toString()).setText(element.course);
      print("done"+count.toString());
    });

    count=0;




    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();
    if (kIsWeb) {
      AnchorElement(
          href:
          'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
      Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }

  }
  Future<void> createExcelStudent() async
  {
    //Create a Excel document.
    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index.
    final Worksheet sheet = workbook.worksheets[0];
    // Set the text value.
    for(int i=0;i<5;i++){
      count=i+1;
      sheet.getRangeByName('A'+count.toString()).setText('احمد اهل');
      sheet.getRangeByName('B'+count.toString()).setText('25482156');
      sheet.getRangeByName('C'+count.toString()).setText('1/2/1999');
      sheet.getRangeByName('D'+count.toString()).setText('76854896');
      sheet.getRangeByName('E'+count.toString()).setText('0595547253');
      sheet.getRangeByName('F'+count.toString()).setText('السابع');
      sheet.getRangeByName('F'+count.toString()).setText('ابو بكر');
      sheet.getRangeByName('G'+count.toString()).setText('متوسطة');
      sheet.getRangeByName('H'+count.toString()).setText('152463');
      sheet.getRangeByName('G'+count.toString()).setText('التفاح');
      sheet.getRangeByName('G'+count.toString()).setText('مدرس');
      sheet.getRangeByName('I'+count.toString()).setText('عليا');
      print("done"+count.toString());
    }
    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();
    if (kIsWeb) {
      AnchorElement(
          href:
          'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
      Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }

  }
  Future<void> createExcelChain() async
  {
    //Create a Excel document.
    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index.
    final Worksheet sheet = workbook.worksheets[0];
    // Set the text value.
    for(int i=0;i<5;i++){
      count=i+1;
      sheet.getRangeByName('A'+count.toString()).setText('عمر بن الخطاب');
      sheet.getRangeByName('B'+count.toString()).setText('انس حبوب');
      sheet.getRangeByName('C'+count.toString()).setText('احمد ارحيم');
      sheet.getRangeByName('D'+count.toString()).setText('الاعدادي');
      sheet.getRangeByName('E'+count.toString()).setText('1');
      print("done"+count.toString());
    }
    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();
    if (kIsWeb) {
      AnchorElement(
          href:
          'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
      Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }

  }
  Future<void> createExcelExam() async
  {
    //Create a Excel document.
    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index.
    final Worksheet sheet = workbook.worksheets[0];
    // Set the text value.
    for(int i=0;i<5;i++){
      count=i+1;
      sheet.getRangeByName('A'+count.toString()).setText('ابو بكر');
      sheet.getRangeByName('B'+count.toString()).setText('احمد اهل');
      sheet.getRangeByName('C'+count.toString()).setText('قد سمع');
      sheet.getRangeByName('D'+count.toString()).setText('90');
      sheet.getRangeByName('E'+count.toString()).setText('ممتاز');
      sheet.getRangeByName('F'+count.toString()).setText('1/4/2021');
      sheet.getRangeByName('F'+count.toString()).setText('ابو بكر');
      print("done"+count.toString());
    }
    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();
    if (kIsWeb) {
      AnchorElement(
          href:
          'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
      Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }

  }
  Future<void> createExcelComing() async
  {
    //Create a Excel document.
    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index.
    final Worksheet sheet = workbook.worksheets[0];
    // Set the text value.
    for(int i=0;i<5;i++){
      count=i+1;
      sheet.getRangeByName('A'+count.toString()).setText('احمد اهل');
      sheet.getRangeByName('B'+count.toString()).setText('حاضر');
      sheet.getRangeByName('C'+count.toString()).setText('1/2/1999');

      print("done"+count.toString());
    }
    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();
    if (kIsWeb) {
      AnchorElement(
          href:
          'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
      Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }

  }


  Future<void> createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();



    page.graphics.drawImage(
        PdfBitmap(await _readImageData('certification.jpg')),
        Rect.fromLTWH(0, 0, 500, 550));



    List<int> bytes = document.save();
    document.dispose();
    if (kIsWeb) {
      saveAndLaunchFileWeb(bytes, 'Output.pdf');
    }else{
      saveAndLaunchFileMobile(bytes, 'Output.pdf');
    }

  }


Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
  Future<void> saveAndLaunchFileMobile(List<int> bytes, String fileName) async {
    final path = (await getExternalStorageDirectory()).path;
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$fileName');
  }
  Future<void> saveAndLaunchFileWeb(List<int> bytes, String fileName) async {
    AnchorElement(
        href:
        "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", fileName)
      ..click();
  }

}
