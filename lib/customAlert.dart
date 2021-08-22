import 'package:flutter/material.dart';

class CustomDialoug {
  CustomDialoug._();
  static CustomDialoug customDialoug = CustomDialoug._();
  showCustomDialoug(String message,BuildContext con) {
    showDialog(
        context: con,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(con).pop();
                  },
                  child: Text('ok'))
            ],
          );
        });
  }
}