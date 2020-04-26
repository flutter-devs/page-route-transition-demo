import 'package:flutter/material.dart';
import 'package:transactions/list.dart';

import 'main.dart';

class SizeAnimation extends StatelessWidget {
  static const routeName = 'Size_Animation';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Size Animation"),
      ),
      body: ListView.builder(
          itemCount: curveList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("${curveList[index]}"),
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                  backgroundColor: Colors.white,
                ),
                onTap: () {
                  print(curveList.length);
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, anotherAnimation) {
                        return ReturnPage();
                      },
                      transitionDuration: Duration(milliseconds: 2000),
                      transitionsBuilder:
                          (context, animation, anotherAnimation, child) {
                        animation = CurvedAnimation(
                            curve: curveList[index], parent: animation);
                        return Align(
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                            axisAlignment: 0.0,
                          ),
                        );
                      }));
                },
              ),
            );
          }),
    );
  }
}
