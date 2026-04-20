import 'package:get/get.dart';

class CalculatorController extends GetxController{

  var input="0".obs;
  void appendValues(String value){
    if(input.value =="0"){
      input.value=value;
    }
    else{
      input.value+=value;
    }
  }

}