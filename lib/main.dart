import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pomodoro',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  // The whole timer widget and options will be here
                  padding: const EdgeInsets.all(20.0),
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    children: [
                      // Options
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              print('Clicked');
                            },
                            child: const Text('Pomodoro'),
                          )),
                          Expanded(
                              child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              print('Clicked');
                            },
                            child: const Text('Short Break'),
                          )),
                          Expanded(
                              child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              print('Clicked');
                            },
                            child: const Text('Long Break'),
                          )),
                        ],
                      ),
                      // Timer
                      const Text(
                        '25.0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print('Clicked');
                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.white),
                        child: const SizedBox(
                          width: 200.0,
                          child: Center(
                            child: Text(
                              'Start',
                              style: TextStyle(
                                fontSize: 20.0
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
