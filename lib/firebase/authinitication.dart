import 'package:firebase_auth/firebase_auth.dart';
import 'package:masjed/MoshrefUi/login/loginScreen.dart';
import 'package:masjed/customAlert.dart';

class Auth_Helper{
  Auth_Helper._();
  static Auth_Helper authHelper=Auth_Helper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<UserCredential> signup(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomDialoug.customDialoug
            .showCustomDialoug('The password provided is too weak.',loginCon);
      } else if (e.code == 'email-already-in-use') {
        CustomDialoug.customDialoug
            .showCustomDialoug('The account already exists for that email.',loginCon);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential> signin(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialoug.customDialoug
            .showCustomDialoug('No user found for that email.',loginCon);
      } else if (e.code == 'wrong-password') {
        CustomDialoug.customDialoug
            .showCustomDialoug('Wrong password provided for that user.',loginCon);
      }
    }
  }

  resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    CustomDialoug.customDialoug.showCustomDialoug(
        'we have sent email for reset password, please check your email',loginCon);
  }

  verifyEmail() async {
    await firebaseAuth.currentUser.sendEmailVerification();
    CustomDialoug.customDialoug.showCustomDialoug(
        'verification email has been sent, please check your email',loginCon);
  }

  logout() async {
    firebaseAuth.signOut();
  }

  bool checkEmailVerification() {
    return firebaseAuth.currentUser?.emailVerified ?? false;
  }
  User user(){
    return firebaseAuth.currentUser;
  }
}