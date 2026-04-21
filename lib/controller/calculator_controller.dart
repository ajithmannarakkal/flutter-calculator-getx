import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();
class CalculatorController extends GetxController{
  var decimalPlaces = 2.obs;
  var input="0".obs;

  var firstNumber=0.0;
  var operator="";
  var history = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    decimalPlaces.value = box.read("decimal") ?? 2;
    history.value = List<String>.from(box.read("history") ?? []);
  }

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
    input.value = result.toStringAsFixed(decimalPlaces.value);
    operator = "";

    String record = "$firstNumber $operator $secondNumber = ${input.value}";
    history.add(record);
    box.write("history", history);
  }

  void setDecimal(int value) {

    decimalPlaces.value = value;
    box.write("decimal", value); // save

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