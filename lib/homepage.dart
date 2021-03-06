import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Model> color = [
    Model(Colors.lightGreenAccent, 1),
    Model(Colors.lightGreen, 2),
    Model(Colors.deepPurple, 3),
    Model(Colors.pinkAccent, 4),
    Model(Colors.greenAccent, 5),
    Model(Colors.deepPurple, 6),
    Model(Colors.deepOrangeAccent, 7),
    Model(Colors.blueGrey, 8),
    Model(Colors.amberAccent, 9),
    Model(Colors.purple, 10),
    Model(Colors.red, 11),
    Model(Colors.purpleAccent, 12),
  ];

  Color? colorName;
  String? data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var preferences = await SharedPreferences.getInstance();

    setState(() {
      data = preferences.getString("color");
      log("----------------------------------------------------------${data}");
      colorName = color[int.parse(data!) - 1].color;
    });
  }

  int index = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorName,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: GridView.count(
              crossAxisCount: 6,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              children: List<Widget>.generate(
                12,
                (index) {
                  return item(
                    color[index].color,
                    () async {
                      setState(() {
                        colorName = color[index].color;
                      });

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("color", "${color[index].id}");
                      var p = prefs.getString("color");
                      log("current drop == >${p}");
                      log("-------${color[index].id}");
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 500, left: 140),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorName,
              ),
              child: const Icon(
                Icons.verified_sharp,
                color: Colors.lightBlue,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget item(Color color, VoidCallback voidCallback) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        height: 30,
        width: 30,
      ),
    );
  }
}
