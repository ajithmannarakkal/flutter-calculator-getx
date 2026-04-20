import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calculator_controller.dart';

class CalculatorScreen extends StatelessWidget {
  final controller = Get.put(CalculatorController());

  CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(children: [
        Expanded(
          child: Container(alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(20),
          child: Text('0'),
          ),
        ),
        GridView.count(crossAxisCount: 4,shrinkWrap: true,
        children: [
          TextButton(onPressed: (){}, child: Text('7')),
          TextButton(onPressed: (){}, child: Text('8')),
          TextButton(onPressed: (){}, child: Text('9')),
          TextButton(onPressed: (){}, child: Text('X')),
          TextButton(onPressed: (){}, child: Text('4')),
          TextButton(onPressed: (){}, child: Text('5')),
          TextButton(onPressed: (){}, child: Text('6')),
          TextButton(onPressed: (){}, child: Text('-')),
          TextButton(onPressed: (){}, child: Text('1')),
          TextButton(onPressed: (){}, child: Text('2')),
          TextButton(onPressed: (){}, child: Text('3')),
          TextButton(onPressed: (){}, child: Text('+'))
        ],
        )
      ],),
    );
  }
}
