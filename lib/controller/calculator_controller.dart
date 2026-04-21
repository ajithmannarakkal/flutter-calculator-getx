import 'package:get/get.dart';

class CalculatorController extends GetxController{

  var input="0".obs;

  var firstNumber=0.0;
  var operator="";

  void setOperator(String op) {
    if (input.value.isEmpty) return;

    if (operator.isNotEmpty) return; // prevent multiple operators

    firstNumber = double.parse(input.value);
    operator = op;
    input.value = "";
  }

  void calculate() {
    if (input.value.isEmpty || operator.isEmpty) return;

    double secondNumber = double.parse(input.value);
    double result = 0;

    switch (operator) {
      case "+":
        result = firstNumber + secondNumber;
        break;
      case "-":
        result = firstNumber - secondNumber;
        break;
      case "*":
        result = firstNumber * secondNumber;
        break;
      case "/":
        if (secondNumber == 0) return; // prevent crash
        result = firstNumber / secondNumber;
        break;
    }

    input.value = result.toString();
    operator = "";
  }


  void appendValues(String value) {
    if (value == "." && input.value.contains(".")) {
      return;
    }

    if (input.value == "0") {
      input.value = value;
    } else {
      input.value += value;
    }
  }

}