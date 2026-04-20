import 'package:get/get.dart';

class CalculatorController extends GetxController{

  var input="0".obs;

  var firstNumber=0.0;
  var operator="";

  void setOperator(String op){
    firstNumber=double.parse(input.value);
    operator=op;
    input.value="";
  }

  void calculate(){
    double secondNumber=double.parse(input.value);
    double result=0;
    switch(operator){
      case "+":
        result=firstNumber+secondNumber;
        break;
      case "-":
        result=firstNumber-secondNumber;
        break;
      case "*":
        result=firstNumber*secondNumber;
        break;
      case "/":
        result=firstNumber/secondNumber;
        break;
    }
    input.value=result.toString();
  }


  void appendValues(String value){
    if(input.value =="0"){
      input.value=value;
    }
    else{
      input.value+=value;
    }
  }

}