import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/materialain.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List color = [
    Colors.lightGreenAccent,
    Colors.green,
    Colors.deepPurple,
    Colors.pinkAccent,
    Colors.deepOrangeAccent,
    Colors.brown,
  ];

  final List color1 = [
    Colors.lightBlueAccent,
    Colors.blueGrey,
    Colors.greenAccent,
    Colors.purple,
    Colors.red,
    Colors.purpleAccent,
  ];

  int isIndex = 0;

  String? choice;

  Color? colors;

  int? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    item(color[index],()=> colors),
                    const SizedBox(
                      height: 10,
                    ),
                    item(color1[index],()=> colors),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 500, left: 140),
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple,
              ),
              child: const Icon(
                Icons.account_circle,
                color: Colors.black87,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget item(Color color , VoidCallback ontap) {
    return Row(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            height: 40,
            width: 40,
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
