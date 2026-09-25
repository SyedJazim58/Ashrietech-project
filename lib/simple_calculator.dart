// import 'package:flutter/material.dart';

// //   double result = double.parse(parts[0]);

// //   for (int i = 1; i < parts.length; i += 2) {
// //     String operator = parts[i];
// //     double number = double.parse(parts[i + 1]);

// //     switch (operator) {
// //       case '+':
// //         result += number;
// //         break;
// //       case '-':
// //         result -= number;
// //         break;
// //       case '*':
// //         result *= number;
// //         break;
// //       case '/':
// //         result /= number;
// //         break;
// //     }
// //   }

// //   if (result % 1 == 0) {
// //     return result.toInt().toString();
// //   }

// //   return result.toString();
// // }

// class SimpleCalculator extends StatefulWidget {
//   const SimpleCalculator({super.key});

//   @override
//   State<SimpleCalculator> createState() => _SimpleCalculatorState();
// }

// class _SimpleCalculatorState extends State<SimpleCalculator> {
//   String display = '0';
//   bool isCalculated = false;

//   Widget myComponent(String label, {void Function()? onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 100,
//         width: 150,
//         color: Colors.blue,
//         alignment: Alignment.center,
//         child: Text(
//           label,
//           style: const TextStyle(fontSize: 24, color: Colors.white),
//         ),
//       ),
//     );
//   }

//   void
//   displayValue(String value) {
//     setState(() {
//       if (value == 'ac') {
//         display = '0';
//       } else if (value == '=') {
//         display = calculatorResult(display);
//       } else if (display == '0') {
//         display = value;
//       } else {
//         display += value;
//       }
//     });
//   }

//   String calculatorResult(String expression){
//     String operator = "";

//     for (int i = 0; i < expression.length; i++) {
//       String character = expression[i];

//       if (character == "+" ||
//           character == "-" ||
//           character == "*" ||
//           character == "/") {
//         operator = character;
//       }
//     }

//     if (operator == " ") {

//     // Implement your calculation logic here
//     // For now, let's just return the expression as the result
//     return expression;
//   }

//   List<String> parts = expression.split(operator);
//   double result = double.parse(parts[0]);

//   for (int i = 1; i < parts.length; i++) {
//       double number = double.parse(parts[i]);

//        if (operator == '+') {
//         result += number;
//       } else if (operator == '-') {
//         result -= number;
//       } else if (operator == '*') {
//         result *= number;
//       } else if (operator == '/') {
//         if (number == 0) {
//           return 'Error';
//         }
//         result /= number;
//       }
//     }

//     return result.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             alignment: Alignment.centerRight,
//             padding: const EdgeInsets.all(20),
//             child: Text(
//               display,
//               style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,

//             children: [
//               myComponent('9', onTap: () =>
//               displayValue('9')),
//               myComponent('8', onTap: () =>
//               displayValue('8')),
//               myComponent('7', onTap: () =>
//               displayValue('7')),
//               myComponent('/', onTap: () =>
//               displayValue('/')),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               myComponent('6', onTap: () =>
//               displayValue('6')),
//               myComponent('5', onTap: () =>
//               displayValue('5')),
//               myComponent('4', onTap: () =>
//               displayValue('4')),
//               myComponent('*', onTap: () =>
//               displayValue('*')),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               myComponent('3', onTap: () =>
//               displayValue('3')),
//               myComponent('2', onTap: () =>
//               displayValue('2')),
//               myComponent('1', onTap: () =>
//               displayValue('1')),
//               myComponent('-', onTap: () =>
//               displayValue('-')),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               myComponent('ac', onTap: () =>
//               displayValue('ac')),
//               myComponent('0', onTap: () =>
//               displayValue('0')),
//               myComponent('=', onTap: () =>
//               displayValue('=')),
//               myComponent('+', onTap: () =>
//               displayValue('+')),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//   switch (operator) {
//     case '+':
//       result += number;
//       break;
//     case '-':
//       result -= number;
//       break;
//     case '*':
//       result *= number;
//       break;
//     case '/':
//       result /= number;
//       break;
//   }
// }

// if (result % 1 == 0) {
//   return result.toInt().toString();
// }

// SIMPLIFIED CALCULATOR

// This file is meant for students who are brand new to Flutter UI.
// It only uses the most basic building blocks:
//   - Container  (a box with width, height and color)
//   - Column     (stacks things vertically)
//   - Row        (stacks things horizontally)
//   - GestureDetector (makes a Container tappable)

// There are no custom widget classes/components here - everything is
// built directly with Container + Row + Column, and a couple of plain
// functions.

import 'package:flutter/material.dart';

class SimplifiedCalculatorApp extends StatelessWidget {
  const SimplifiedCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SimplifiedCalculatorScreen());
  }
}

class SimplifiedCalculatorScreen extends StatefulWidget {
  const SimplifiedCalculatorScreen({super.key});

  @override
  State<SimplifiedCalculatorScreen> createState() =>
      _SimplifiedCalculatorScreenState();
}

class _SimplifiedCalculatorScreenState
    extends State<SimplifiedCalculatorScreen> {
  // Whatever is currently shown on the screen.
  String display = '0';

  // The buttons, laid out exactly the way they will appear:
  // 4 rows, 4 buttons per row.
  final List<List<String>> buttonRows = [
    ['7', '8', '9', '/'],
    ['4', '5', '6', '*'],
    ['1', '2', '3', '-'],
    ['C', '0', '=', '+'],
  ];

  // ---------- FUNCTIONS ----------

  // Runs whenever any button is tapped.
  void onButtonTap(String label) {
    setState(() {
      if (label == 'C') {
        display = '0';
      } else if (label == '=') {
        display = calculateResult(display);
      } else {
        if (display == '0') {
          display = label;
        } else {
          display = display + label;
        }
      }
    });
  }

  // Very simple calculator: only handles ONE operator, e.g. "12+7".
  // Good enough for a first Flutter UI project.
  String calculateResult(String expression) {
    String operator = '';

    // Find the operator
    for (int i = 0; i < expression.length; i++) {
      String character = expression[i];

      if (character == '+' ||
          character == '-' ||
          character == '*' ||
          character == '/') {
        operator = character;
        break;
      }
    }

    if (operator == '') {
      return expression;
    }

    // Split all numbers
    List<String> parts = expression.split(operator);

    double result = double.parse(parts[0]);

    // Calculate with all remaining numbers
    for (int i = 1; i < parts.length; i++) {
      double number = double.parse(parts[i]);

      if (operator == '+') {
        result += number;
      } else if (operator == '-') {
        result -= number;
      } else if (operator == '*') {
        result *= number;
      } else if (operator == '/') {
        if (number == 0) {
          return 'Error';
        }
        result /= number;
      }
    }

    return result.toString();
  }

  // Picks a color for a button just by looking at its label.
  Color colorForButton(String label) {
    if (label == 'C') {
      return Colors.red;
    } else if (label == '+' ||
        label == '-' ||
        label == '*' ||
        label == '/' ||
        label == '=') {
      return Colors.orange;
    } else {
      return Colors.grey.shade800;
    }
  }

  Widget myComponent(String label, {void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 150,
        color: Colors.blue,
        child: Text(label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simplified Calculator')),
      body: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              // ----- SCREEN: shows the current display text -----
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.black,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(20),
                child: Text(
                  display,
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),

              // ----- BUTTONS: one Row per row of buttons -----
              // FOR LOOP: go through every row in buttonRows.
              for (List<String> row in buttonRows)
                Row(
                  children: [
                    // FOR LOOP: go through every label in this row.
                    for (String label in row)
                      GestureDetector(
                        onTap: () => onButtonTap(label),
                        child: Container(
                          width: 90,
                          height: 90,
                          margin: const EdgeInsets.all(6),
                          color: colorForButton(label),
                          alignment: Alignment.center,
                          child: Text(
                            label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
