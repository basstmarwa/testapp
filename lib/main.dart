import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Key myKey = const Key('myKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("my App")),
      body: Center(
        child: GestureDetector(
          onTap: onScreenTap,
          child: Container(
            key: myKey,
            width: double.infinity,
            height: double.infinity,
            color: currentColor,
            child: const Center(
              child: Text(
                'Hello there',
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Random rnd = Random();

// min && max are the range of Color saturation value
  int min = 50;
  int max = 255;
  Color currentColor = Color.fromARGB(255, 255, 255, 255);

// generate and return a random color through random value of RGB Colors
  Color _generateRandomColor() {
    int _red = min + rnd.nextInt(max - min);
    int _green = min + rnd.nextInt(max - min);
    int _blue = min + rnd.nextInt(max - min);

    return Color.fromARGB(255, _red, _green, _blue);
  }

  void onScreenTap() {
    setState(() {
      currentColor = _generateRandomColor();
    });
  }
}
