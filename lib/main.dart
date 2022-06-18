import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static int _currentTaskState = 1;

  void _setCurrentState<int>(param) {
    print(
      "initial State: " + _currentTaskState.toString(),
    );
    setState(() {
      _currentTaskState = param;
    });
    print("current State: " + _currentTaskState.toString());
  }

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
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      // The whole timer widget and options will be here
                      padding: const EdgeInsets.all(20.0),
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Options
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                    ),
                                    onPressed: () => _setCurrentState(1),
                                    child: const Text('Pomodoro'),
                                  ),
                                ),
                                Expanded(
                                    child: TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  onPressed: () => _setCurrentState(2),
                                  child: const Text('Short Break'),
                                )),
                                Expanded(
                                    child: TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  onPressed: () => _setCurrentState(3),
                                  child: const Text('Long Break'),
                                )),
                              ],
                            ),
                          ),

                          //Timer Widget
                          TimerContainer(),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  // decoration: const BoxDecoration(color: Colors.green),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Task Title + Task Menu Option
                      Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2.0,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        child: Text('Tasks',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      //Task list => Task Item Checkbox - Task Details
                      //Add New Task
                      Center(
                        child: DottedBorder(
                          color: Colors.grey,
                          dashPattern: const [10, 7],
                          radius: const Radius.circular(20.0),
                          borderType: BorderType.RRect,
                          strokeWidth: 2,
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black38),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    // side: const BorderSide(
                                    //     width: 2.0, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(double.infinity, 70.0)),
                            ),
                            child: Text(
                              'Add New Task',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimerContainer extends StatelessWidget {
  const TimerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Timer();
  }
}

class Timer extends StatelessWidget {
  const Timer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            '25:00',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 70.0),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            child: const SizedBox(
              width: 200.0,
              child: Center(
                child: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
