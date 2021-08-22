import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/examAdding/testName.dart';
import 'package:masjed/firebase/storage.dart';
import 'package:masjed/model/StudentModel.dart';
import 'package:masjed/provider.dart';
import 'package:provider/provider.dart';
class BeginOfPage extends StatelessWidget {
  var icon;

  BeginOfPage(this.icon);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderMasjed>(
      builder:(context,ProviderMasjed,x)=> Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [icon],
          ),
          TestName("اسم الحلقة", [],""),
          TestName("اسم الطالب",[], "")


        ],
      ),
    );
  }
}
