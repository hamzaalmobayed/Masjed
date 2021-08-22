import 'dart:io';
import 'package:masjed/model/ChainModel.dart';
import 'package:masjed/model/ExamModel.dart';
import 'package:masjed/model/HefthModel.dart';
import 'package:masjed/model/MohafethModel.dart';
import 'package:masjed/model/MoshrefModel.dart';
import 'package:masjed/model/StudentModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  static final String dbName = 'tasks.db';
  static final String tableName1 = 'mohafeth';
  static final String tableName2 = 'student';
  static final String tableName3 = 'chain';
  static final String tableName4 = 'exam';
  static final String tableName5 = 'moshref';
  static final String tableName6 = 'hefth';

  static final String mohafethNameColumn = 'mohafethName';
  static final String mohafethCardColumn = 'mohafethCard';
  static final String mohafethBirthdayColumn = 'mohafethBirthday';
  static final String mohafethFieldColumn = 'mohafethField';
  static final String mohafethMobileColumn = 'mohafethMobile';
  static final String mohafethChainColumn = 'mohafethChain';
  static final String mohafethStatusColumn = 'mohafethStatus';
  static final String mohafethPasswordColumn = 'mohafethPassword';
  static final String mohafethCourseColumn = 'mohafethCourse';

  static final String studentNameColumn = 'studentName';
  static final String studentCardColumn = 'studentCard';
  static final String studentBirthdayColumn = 'studentBirthday';
  static final String studentClassColumn = 'studentClass';
  static final String studentMobileColumn = 'studentMobile';
  static final String studentChainColumn = 'studentChain';
  static final String studentStatusColumn = 'studentStatus';
  static final String studentPasswordColumn = 'studentPassword';
  static final String studentCourseColumn = 'studentCourse';
  static final String studentAddressColumn = 'studentAddress';

  static final String chainNameColumn = 'chainName';
  static final String chainMohafethColumn = 'chainMohafeth';
  static final String chainHelperColumn = 'chainHelper';
  static final String chainAgeColumn = 'chainAge';
  static final String chainNumberColumn = 'chainNumber';

  static final String examChainColumn = 'examChain';
  static final String examStudentColumn = 'examStudent';
  static final String examNameColumn = 'examName';
  static final String examGradeColumn = 'examGrade';
  static final String examEstimateColumn = 'examEstimate';
  static final String examDateColumn = 'examDate';
  static final String examPersonColumn = 'examPerson';

  static final String moshrefNameColumn = 'moshrefName';
  static final String moshrefCardColumn = 'moshrefCard';
  static final String moshrefBirthdayColumn = 'moshrefBirthday';
  static final String moshrefFieldColumn = 'moshrefField';
  static final String moshrefMobileColumn = 'moshrefMobile';
  static final String moshrefJobColumn = 'moshrefJob';
  static final String moshrefStatusColumn = 'moshrefStatus';

  static final String studentNameHefthColumn = 'studentNameHefth';
  static final String beginAyaColumn = 'beginAya';
  static final String beginSoraColumn = 'beginSora';
  static final String endAyaColumn = 'endAya';
  static final String endSoraColumn = 'endSora';
  static final String pageNumberColumn = 'pageNumber';
  static final String revisionPageColumn = 'revisionPage';
  static final String estimateColumn = 'estimate';

  Database database;

  initDataBase() async {
    database = await createConnection();
  }

  Future<Database> createConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Database database = await openDatabase(join(directory.path, dbName),
        version: 1,onConfigure:(db) {
      db.execute('PRAGMA FOREIGN_KEY=ON');
        }
        , onCreate: (db, version) {
          db.execute(
              '''CREATE TABLE $tableName1 ($mohafethNameColumn TEXT PRIMARY KEY, $mohafethCardColumn TEXT,
               $mohafethBirthdayColumn TEXT ,$mohafethFieldColumn TEXT ,$mohafethMobileColumn TEXT , $mohafethChainColumn TEXT ,
               $mohafethStatusColumn TEXT ,$mohafethPasswordColumn TEXT , $mohafethCourseColumn TEXT)''');

          db.execute(
              '''CREATE TABLE $tableName2 ($studentNameColumn TEXT PRIMARY KEY,$studentBirthdayColumn TEXT
              , $studentCardColumn TEXT ,$studentMobileColumn TEXT,$studentClassColumn TEXT  , $studentChainColumn TEXT ,
               $studentStatusColumn TEXT ,$studentPasswordColumn TEXT , $studentAddressColumn TEXT , $studentCourseColumn TEXT)''');

          db.execute(
              '''CREATE TABLE $tableName3 ($chainNameColumn TEXT PRIMARY KEY,$chainMohafethColumn TEXT
              , $chainHelperColumn TEXT ,$chainAgeColumn TEXT,$chainNumberColumn TEXT )''');

          db.execute(
              '''CREATE TABLE $tableName4 ($examChainColumn TEXT ,$examStudentColumn TEXT
              , $examNameColumn TEXT PRIMARY KEY ,$examGradeColumn TEXT,$examEstimateColumn TEXT  , $examDateColumn TEXT ,
               $examPersonColumn TEXT )''');

          db.execute(
              '''CREATE TABLE $tableName5 ($moshrefNameColumn TEXT , $moshrefBirthdayColumn TEXT,
               $moshrefFieldColumn TEXT ,$moshrefMobileColumn TEXT ,$moshrefJobColumn TEXT , $moshrefStatusColumn TEXT 
               )''');

          db.execute(
              '''CREATE TABLE $tableName6 ($studentNameHefthColumn TEXT PRIMARY KEY , $beginAyaColumn TEXT
              , $beginSoraColumn TEXT  , $endAyaColumn TEXT, $endSoraColumn TEXT  , $pageNumberColumn TEXT ,
               $revisionPageColumn TEXT , $estimateColumn TEXT)''');
        });
    return database;
  }

  Future<int> createMohafeth(Mohafeth_model mohafeth) async {
    try {
      int rowCount = await database.insert(tableName1, mohafeth.toMap());
      return rowCount;
    } catch (e) {
      return null;
    }
  }

  Future<List<Mohafeth_model>> getAllMohafeth() async {
    try {
      List<Map<String, dynamic>> results = await database.query(tableName1);
      List<Mohafeth_model> mohafeth =
      results.map((e) => Mohafeth_model.fromMap(e)).toList();
      return mohafeth;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateMohafeth( Mohafeth_model mohafeth) async {
    try {
      await database.update(tableName1, mohafeth.toMap(),
          where: '$mohafethNameColumn=?', whereArgs: [mohafeth.mohafethName]);
      return true;
    } catch (x) {
      return null;
    }
  }

  Future<bool> deleteMohafeth( Mohafeth_model mohafeth) async {
    try {
      await database
          .delete(tableName1, where: '$mohafethNameColumn=?', whereArgs: [mohafeth.mohafethName]);
      return true;
    } catch (e) {
      return null;
    }
  }
  /****************student*************/
  Future<int> createStudent(Student_model student) async {
    try {
      int rowCount = await database.insert(tableName2, student.toMap());
      return rowCount;
    } catch (e) {
      return null;
    }
  }

  Future<List<Student_model>> getAllStudent() async {
    try {
      List<Map<String, dynamic>> results = await database.query(tableName2);
      List<Student_model> student =
      results.map((e) => Student_model.fromMap(e)).toList();
      return student;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateStudent( Student_model student) async {
    try {
      await database.update(tableName2, student.toMap(),
          where: '$studentNameColumn=?', whereArgs: [student.studentName]);
      return true;
    } catch (x) {
      return null;
    }
  }

  Future<bool> deleteTask(Student_model student) async {
    try {
      await database
          .delete(tableName2, where: '$mohafethNameColumn=?', whereArgs: [student.studentName]);
      return true;
    } catch (e) {
      return null;
    }
  }
  /****************chain*************/
  Future<int> createChain(Chain_model chain) async {
    try {
      int rowCount = await database.insert(tableName3, chain.toMap());
      return rowCount;
    } catch (e) {
      return null;
    }
  }

  Future<List<Chain_model>> getAllChain() async {
    try {
      List<Map<String, dynamic>> results = await database.query(tableName3);
      List<Chain_model> chain =
      results.map((e) => Chain_model.fromMap(e)).toList();
      return chain;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateChain( Chain_model chain) async {
    try {
      await database.update(tableName2, chain.toMap(),
          where: '$chainNameColumn=?', whereArgs: [chain.chainName]);
      return true;
    } catch (x) {
      return null;
    }
  }

  Future<bool> deleteChain(Chain_model chain) async {
    try {
      await database
          .delete(tableName3, where: '$chainNameColumn=?', whereArgs: [chain.chainName]);
      return true;
    } catch (e) {
      return null;
    }
  }
  /****************exam*************/
  Future<int> createExam(Exam_model exam) async {
    try {
      int rowCount = await database.insert(tableName4, exam.toMap());
      return rowCount;
    } catch (e) {
      return null;
    }
  }

  Future<List<Exam_model>> getAllExam() async {
    try {
      List<Map<String, dynamic>> results = await database.query(tableName4);
      List<Exam_model> exam =
      results.map((e) => Exam_model.fromMap(e)).toList();
      return exam;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateExam( Exam_model exam) async {
    try {
      await database.update(tableName4, exam.toMap(),
          where: '$examNameColumn=?', whereArgs: [exam.examName]);
      return true;
    } catch (x) {
      return null;
    }
  }

  Future<bool> deleteExam(Exam_model exam) async {
    try {
      await database
          .delete(tableName4, where: '$examNameColumn=?', whereArgs: [exam.examName]);
      return true;
    } catch (e) {
      return null;
    }
  }/****************moshref*************/
  Future<int> createMoshref(Moshref_model moshref) async {
    try {
      int rowCount = await database.insert(tableName5, moshref.toMap());
      return rowCount;
    } catch (e) {
      return null;
    }
  }

  Future<List<Moshref_model>> getAllMoshref() async {
    try {
      List<Map<String, dynamic>> results = await database.query(tableName5);
      List<Moshref_model> moshref =
      results.map((e) => Moshref_model.fromMap(e)).toList();
      return moshref;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateMoshref( Moshref_model moshref) async {
    try {
      await database.update(tableName5, moshref.toMap(),
          where: '$moshrefNameColumn=?', whereArgs: [moshref.moshrefName]);
      return true;
    } catch (x) {
      return null;
    }
  }

  Future<bool> deleteMoshref(Moshref_model moshref) async {
    try {
      await database
          .delete(tableName5, where: '$moshrefNameColumn=?', whereArgs: [moshref.moshrefName]);
      return true;
    } catch (e) {
      return null;
    }
  }
  /****************REPORT*************/
  Future<int> createHefth(Hefth_Model hefth) async {
    try {
     // List list = await database.query('hefth');
     // print(list.length);

      int rowCount = await database.insert('hefth', hefth.toMap());

      return rowCount;
    } catch (e) {
      return null;
    }
  }

  Future<List<Hefth_Model>> getAllHefth() async {
    try {
      List<Map<String, dynamic>> results = await database.query(tableName6);
      List<Hefth_Model> moshref =
      results.map((e) => Hefth_Model.fromMap(e)).toList();
      return moshref;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateHefth( Hefth_Model hefth) async {
    try {
      await database.update(tableName6, hefth.toMap(),
          where: '$studentNameHefthColumn=?', whereArgs: [hefth.studentNameHefth]);
      return true;
    } catch (x) {
      return null;
    }
  }

  Future<bool> deleteHefth(Hefth_Model hefth) async {
    try {
      await database
          .delete(tableName6, where: '$studentNameHefthColumn=?', whereArgs: [hefth.studentNameHefth]);
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<List> getTableNames() async {
    // List<Map<String, Object>> tables = await database
    //     .query('sqlite_master', where: 'type=?', whereArgs: ['table']);
    // print(tables);
    // List tabelnames = tables.map((e) {
    //   print( e['name']);
    //   return  e['name'];
    // }).toList();
    // print(tabelnames.length);
    // return tabelnames;
  }

}
