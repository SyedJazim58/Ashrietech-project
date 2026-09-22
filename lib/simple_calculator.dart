import 'package:flutter/material.dart';

// String calculateBasicExpression(String expression) {
//   String cleanExpression = expression.replaceAll(' ', '');

//   if (cleanExpression.isEmpty || cleanExpression == '0') {
//     return '0';
//   }

//   List<String> parts = [];
//   String current = '';

//   for (int i = 0; i < cleanExpression.length; i++) {
//     String character = cleanExpression[i];

//     if (character == '+' || character == '-' || character == '*' || character == '/') {
//       if (current.isNotEmpty) {
//         parts.add(current);
//         current = '';
//       }
//       parts.add(character);
//     } else {
//       current += character;
//     }
//   }

//   if (current.isNotEmpty) {
//     parts.add(current);
//   }

//   if (parts.length < 3) {
//     return cleanExpression;
//   }

//   double result = double.parse(parts[0]);

//   for (int i = 1; i < parts.length; i += 2) {
//     String operator = parts[i];
//     double number = double.parse(parts[i + 1]);

//     switch (operator) {
//       case '+':
//         result += number;
//         break;
//       case '-':
//         result -= number;
//         break;
//       case '*':
//         result *= number;
//         break;
//       case '/':
//         result /= number;
//         break;
//     }
//   }

//   if (result % 1 == 0) {
//     return result.toInt().toString();
//   }

//   return result.toString();
// }

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String display = '0';
  bool isCalculated = false;

  Widget myComponent(String label, {void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 150,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  void displayValue(String value) {
    setState(() {
      if (value == 'ac') {
        display = '0';
      } else if (value == '=') {
        display = calculatorResult(display);
      } else if (display == '0') {
        display = value;
      } else {
        display += value;
      }
    });
  }

  String calculatorResult(String expression){
    String operator = "";

    for (int i = 0; i < expression.length; i++) {
      String character = expression[i];

      if (character == "+" ||
          character == "-" ||
          character == "*" ||
          character == "/") {
        operator = character;
      }
    }

    if (operator == " ") {

      
    // Implement your calculation logic here
    // For now, let's just return the expression as the result
    return expression;
  }


  List<String> parts = expression.split(operator);
  double result = double.parse(parts[0]);

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


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              display,
              style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              myComponent('9', onTap: () => displayValue('9')),
              myComponent('8', onTap: () => displayValue('8')),
              myComponent('7', onTap: () => displayValue('7')),
              myComponent('/', onTap: () => displayValue('/')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myComponent('6', onTap: () => displayValue('6')),
              myComponent('5', onTap: () => displayValue('5')),
              myComponent('4', onTap: () => displayValue('4')),
              myComponent('*', onTap: () => displayValue('*')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myComponent('3', onTap: () => displayValue('3')),
              myComponent('2', onTap: () => displayValue('2')),
              myComponent('1', onTap: () => displayValue('1')),
              myComponent('-', onTap: () => displayValue('-')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myComponent('ac', onTap: () => displayValue('ac')),
              myComponent('0', onTap: () => displayValue('0')),
              myComponent('=', onTap: () => displayValue('=')),
              myComponent('+', onTap: () => displayValue('+')),
            ],
          ),
        ],
      ),
    );
  }
}








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
