import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calculator_controller.dart';

class CalculatorScreen extends StatelessWidget {
  final controller = Get.put(CalculatorController());

  CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Obx(() => Text(controller.input.value)),
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            children: [
              TextButton(
                onPressed: () => controller.appendValues("7"),
                child: Text('7'),
              ),
              TextButton(
                onPressed: () => controller.appendValues("8"),
                child: Text('8'),
              ),
              TextButton(
                onPressed: () => controller.appendValues("9"),
                child: Text('9'),
              ),
              TextButton(onPressed: () =>controller.setOperator("*"), child: Text('X')),
              TextButton(
                onPressed: () => controller.appendValues("4"),
                child: Text('4'),
              ),
              TextButton(
                onPressed: () => controller.appendValues("5"),
                child: Text('5'),
              ),
              TextButton(
                onPressed: () => controller.appendValues("6"),
                child: Text('6'),
              ),
              TextButton(onPressed: ()=>controller.setOperator("-"), child: Text('-')),
              TextButton(
                onPressed: () => controller.appendValues("1"),
                child: Text('1'),
              ),
              TextButton(
                onPressed: () => controller.appendValues("2"),
                child: Text('2'),
              ),
              TextButton(
                onPressed: () => controller.appendValues("3"),
                child: Text('3'),
              ),
              TextButton(onPressed: () =>controller.setOperator("+"), child: Text('+')),
              TextButton(onPressed: () =>controller.calculate(), child: Text('=')),

            ],
          ),
        ],
      ),
    );
  }
}
