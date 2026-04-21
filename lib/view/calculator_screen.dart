import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calculator_controller.dart';

class CalculatorScreen extends StatelessWidget {
  final controller = Get.put(CalculatorController());

  CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],        title: Text('Calculator'),actions: [IconButton(
        onPressed: () {
          Get.bottomSheet(
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.history.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.history[index]),
                    );
                  },
                );
              }),
            ),
          );
        },
        icon: Icon(Icons.history),
      )],),
      body: Column(
        children: [
          Expanded(  flex: 3,

            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Obx(() => Text(
                  controller.input.value,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(bottom: 12),

              child: GridView.count(
                crossAxisCount: 4,
                // shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.appendValues("7"),
                      child: Text('7'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.appendValues("8"),
                      child: Text('8'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.appendValues("9"),
                      child: Text('9'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(onPressed: () =>controller.setOperator("*"), child: Text('X')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.appendValues("4"),
                      child: Text('4'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.appendValues("5"),
                      child: Text('5'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.appendValues("6"),
                      child: Text('6'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(onPressed: ()=>controller.setOperator("-"), child: Text('-')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.appendValues("1"),
                      child: Text('1'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.appendValues("2"),
                      child: Text('2'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.appendValues("3"),
                      child: Text('3'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(onPressed: () =>controller.setOperator("+"), child: Text('+')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.setDecimal(2),
                      child: Text("2dp"),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.setDecimal(4),
                      child: Text("4dp"),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => controller.setDecimal(6),
                      child: Text("6dp"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(onPressed: () =>controller.calculate(), child: Text('=')),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
