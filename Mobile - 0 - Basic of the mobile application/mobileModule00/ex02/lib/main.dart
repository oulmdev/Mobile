import 'package:flutter/material.dart';
import 'buttons.dart';
import 'dart:collection';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  String _output = "0";
  String _input = "";
  var inputStack = ListQueue<double>();
  List arithmeticOperators = ["+", "-", "x", "÷", "%"];

  bool isDigit(String character) {
    return character.codeUnitAt(character.length - 1) >= 48 &&
        character.codeUnitAt(character.length - 1) <= 57;
  }

  void calculator() {
    _input = _input.replaceAll("x", "*");
    _input = _input.replaceAll("÷", "/");

    if (isDigit(_input) == false) {
      print(_input.substring(0, _input.length - 1));
      inputStack.add(double.parse(_input.substring(0, _input.length - 1)));
      // print("the last element of stack = ");
    }
  }

  void updateOutput(String value) {
    setState(() {
      if (value == "0") {
        _output = "0";
      } else {
        calculator();
        _output += value;
      }
    });
  }

  void updateInput(String value) {
    setState(() {
      if (value == "") {
        _input = "";
      } else {
        _input += value;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18, left: 30),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  _input,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18, left: 30),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  _output,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonsGenerator(
                      buttonColor: Color.fromARGB(255, 200, 200, 200),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.black,
                      buttonText: "C",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("");
                        updateOutput("0");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: Color.fromARGB(255, 200, 200, 200),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.black,
                      buttonText: "AC",
                      fontSize: 20,
                      onPressed: () {
                        updateOutput("");
                        updateOutput("0");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: Color.fromARGB(255, 200, 200, 200),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.black,
                      buttonText: "%",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("%");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: Color.fromARGB(255, 251, 180, 0),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "÷",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("÷");
                        updateOutput("");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "7",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("7");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "8",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("8");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "9",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("9");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: Color.fromARGB(255, 251, 180, 0),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "x",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("x");
                        updateOutput("");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "4",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("4");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "5",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("5");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "6",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("6");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: Color.fromARGB(255, 251, 180, 0),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "-",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("-");
                        updateOutput("");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "1",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("1");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "2",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("2");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "3",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("3");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: Color.fromARGB(255, 251, 180, 0),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "+",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("+");
                        updateOutput("");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "0",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("0");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "00",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("00");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: const Color.fromARGB(255, 125, 125, 125),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: ".",
                      fontSize: 20,
                      onPressed: () {
                        updateInput(".");
                        updateOutput("");
                      },
                    ),
                    ButtonsGenerator(
                      buttonColor: Color.fromARGB(255, 137, 254, 128),
                      splashColor: Color.fromARGB(255, 255, 99, 99),
                      textColor: Colors.white,
                      buttonText: "=",
                      fontSize: 20,
                      onPressed: () {
                        updateInput("=");
                        updateOutput("");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
