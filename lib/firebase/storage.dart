import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masjed/model/MohafethModel.dart';
import 'package:masjed/model/StudentModel.dart';
import 'package:masjed/provider.dart';

class FireStore_Helper {
  FireStore_Helper._();

  static FireStore_Helper FireStoreHelper = FireStore_Helper._();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;



  Future<List<Mohafeth_model>> getAllMohafethFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await fireStore.collection('mohafeths').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    List<Mohafeth_model> users =
    docs.map((e) => Mohafeth_model.fromMap(e.data())).toList();
    print(users.length);
    return users;
  }
  Future<List<Student_model>> getAllStudentFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await fireStore.collection('students').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    List<Student_model> users =
    docs.map((e) => Student_model.fromMap(e.data())).toList();
    print(users.length);
    return users;
  }

  Future<void> add(String table, map) {
    // Call the user's CollectionReference to add a new user
    return fireStore
        .collection(table)
        .add(map)
        .then((value) => print(" Added"))
        .catchError((error) => print("Failed to add : $error"));
  }

  Future<void> update(id, map, collection) {
    return fireStore
        .collection(collection)
        .doc(id)
        .update(map)
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> delete(id, collection) {
    return fireStore
        .collection(collection)
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
  getUserFromFirestore(String userId,table) async {
    DocumentSnapshot documentSnapshot =
    await fireStore.collection(table).doc(userId).get();

    print(documentSnapshot.data());
  }



}
