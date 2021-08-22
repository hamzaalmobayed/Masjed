import 'package:flutter/material.dart';
import 'package:masjed/MoshrefUi/examAdding/beginOfPage.dart';

import 'bottomBar.dart';
class GeneralBottomBar extends StatelessWidget {

Widget widget;

GeneralBottomBar(this.widget);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder:(context)=> Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_forward),
                color: Colors.black,
                iconSize: 30,
                onPressed: () {

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (con) => widget));}
              ),
            ],
          ),
          BottomBar(),
        ],
      ),
    );
  }
}
