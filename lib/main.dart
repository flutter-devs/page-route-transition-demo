import 'package:flutter/material.dart';

import 'RotationAnimation.dart';
import 'fadeAnimation.dart';
import 'scaleAnimation.dart';
import 'sizeAnimation.dart';
import 'slideAnimation.dart';

main() {
  runApp(MaterialApp(
    routes: {
      SlideAnimation.routeName: (context) => SlideAnimation(),
      FadeAnimation.routeName: (context) => FadeAnimation(),
      ScaleAnimation.routeName: (context) => ScaleAnimation(),
      SizeAnimation.routeName: (context) => SizeAnimation(),
      RotationAnimation.routeName: (context) => RotationAnimation()
    },
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Page Tranaction")),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(animationTypeList[index]);
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text("${index + 1}"),
                  ),
                  title: Text(animationTypeList[index].toString()),
                ),
              ),
            );
          },
          itemCount: animationTypeList.length,
        ),
      ),
    ),
  ));
}

class ReturnPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Yoooooooooo !'),
      ),
    );
  }
}

var animationTypeList = [
  SlideAnimation.routeName,
  FadeAnimation.routeName,
  ScaleAnimation.routeName,
  SizeAnimation.routeName,
  RotationAnimation.routeName
];
