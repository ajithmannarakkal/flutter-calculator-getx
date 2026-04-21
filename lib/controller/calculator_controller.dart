import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CalculatorController extends GetxController {
  final box = GetStorage();
  var decimalPlaces = 2.obs;
  var input = "0".obs;
  var expression = "".obs;
  var isDarkMode = false.obs;

  var firstNumber = 0.0;
  var operator = "";
  var history = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    decimalPlaces.value = box.read("decimal") ?? 2;
    isDarkMode.value = box.read("isDarkMode") ?? false;

    List savedHistory = box.read("history") ?? [];
    history.value = List<String>.from(savedHistory);
  }

  void setOperator(String op) {
    if (input.value.isEmpty || input.value == ".") return;

    if (operator.isNotEmpty) {
      calculate();
    }

    firstNumber = double.parse(input.value);
    operator = op;
    expression.value = "$firstNumber $op";
    input.value = "";
  }

  void calculate() {
    if (input.value.isEmpty || input.value == "." || operator.isEmpty) return;

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
        if (secondNumber == 0) {
          Get.snackbar(
            "Error",
            "Cannot divide by zero",
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
        result = firstNumber / secondNumber;
        break;
    }

    String record =
        "$firstNumber $operator $secondNumber = ${result.toStringAsFixed(decimalPlaces.value)}";
    input.value = result.toStringAsFixed(decimalPlaces.value);
    expression.value = "";
    operator = "";

    history.add(record);
    box.write("history", history.toList());
  }

  void clear() {
    input.value = "0";
    expression.value = "";
    operator = "";
    firstNumber = 0.0;
  }

  void setDecimal(int value) {
    decimalPlaces.value = value;
    box.write("decimal", value); // save
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    box.write("isDarkMode", isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void appendValues(String value) {
    if (value == "." && input.value.contains(".")) {
      Get.snackbar(
        "Invalid Input",
        "Decimal already exists",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (input.value == "0" && value != ".") {
      input.value = value;
    } else {
      input.value += value;
    }
  }
}
