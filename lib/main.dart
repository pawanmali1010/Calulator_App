import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  int? num1;
  int? num2;
  String result = "";
  String finalResult = "";
  String operator = "";

  void btnClicked(String btnValue) {
    setState(() {
      if (btnValue == "C") {
        num1 = 0;
        num2 = 0;
        result = "";
        finalResult = "";
        operator = "";
      } else if (btnValue == "+" || btnValue == "-" || btnValue == "*" || btnValue == "/") {
        num1 = int.tryParse(result) ?? 0;
        operator = btnValue;
        result = "";
      } else if (btnValue == "=") {
        num2 = int.tryParse(result) ?? 0;

        print("tesing result : $result");
        switch (operator) {
          case "+":
            finalResult = (num1! + num2!).toString();
            break;
          case "-":
            finalResult = (num1! - num2!).toString();
            break;
          case "*":
            finalResult = (num1! * num2!).toString();
            break;
          case "/":
            if (num2 != 0) {
              finalResult = (num1! / num2!).toStringAsFixed(2);
            } else {
              finalResult = "Error";
            }
            break;
        }

        print("finLal result : $finalResult");
         print(" result : $result");
         result = finalResult;
      } else {
        result += btnValue;
      }
    });
  }
//Custome Button Widget
  Widget customButton(String btnValue) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: () {
            btnClicked(btnValue);
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          child: Text(
            btnValue,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
//Body Code Write Here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator App"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                result,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          Row(
            children: [
              customButton("9"),
              customButton("8"),
              customButton("7"),
              customButton("+"),
            ],
          ),
          Row(
            children: [
              customButton("6"),
              customButton("5"),
              customButton("4"),
              customButton("-"),
            ],
          ),
          Row(
            children: [
              customButton("3"),
              customButton("2"),
              customButton("1"),
              customButton("*"),
            ],
          ),
          Row(
            children: [
              customButton("C"),
              customButton("0"),
              customButton("="),
              customButton("/"),
            ],
          ),
        ],
      ),
    );
  }
}
