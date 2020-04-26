import 'package:flutter/material.dart';
import 'list.dart';

import 'main.dart';

class FadeAnimation extends StatelessWidget {
  static const routeName = 'Fade_Animation';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fade Animation"),
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
                        return FadeTransition(
                          opacity:animation,
                          child: child,
                        );
                      }));
                },
              ),
            );
          }),
    );
  }
}
