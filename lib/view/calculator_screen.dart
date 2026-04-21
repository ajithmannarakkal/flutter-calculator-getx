import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calculator_controller.dart';

class CalculatorScreen extends StatelessWidget {
  final controller = Get.put(CalculatorController());

  CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        actions: [
          Obx(() => IconButton(
            onPressed: () => controller.toggleTheme(),
            icon: Icon(controller.isDarkMode.value ? Icons.light_mode : Icons.dark_mode),
          )),
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  padding: EdgeInsets.all(16),
                  color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
                  child: Obx(() {
                    if (controller.history.isEmpty) {
                      return Center(child: Text("No history yet"));
                    }
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
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;
          int displayFlex = isLandscape ? 2 : 3;
          int gridFlex = isLandscape ? 6 : 5;

          double displayFontSize = constraints.maxHeight * 0.08;
          double buttonFontSize = constraints.maxWidth * (isLandscape ? 0.03 : 0.045);

          double gridHeight = (constraints.maxHeight * gridFlex / (displayFlex + gridFlex)) - 12;
          double cellWidth = constraints.maxWidth / 4;
          double cellHeight = gridHeight / 5;
          double aspectRatio = cellWidth / cellHeight;

          return Column(
            children: [
              Expanded(flex: displayFlex,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(isLandscape ? 8 : 20),
                    child: Obx(() => Text(
                      controller.input.value,
                      style: TextStyle(
                        fontSize: displayFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
              Expanded(
                flex: gridFlex,
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLandscape ? 4 : 12),
                  child: GridView.count(
                    crossAxisCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: aspectRatio,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("7"),
                          child: Text('7', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("8"),
                          child: Text('8', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("9"),
                          child: Text('9', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.setOperator("/"),
                          child: Text('÷', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("4"),
                          child: Text('4', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("5"),
                          child: Text('5', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("6"),
                          child: Text('6', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.setOperator("*"),
                          child: Text('×', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("1"),
                          child: Text('1', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("2"),
                          child: Text('2', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("3"),
                          child: Text('3', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.setOperator("-"),
                          child: Text('-', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("0"),
                          child: Text('0', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.appendValues("."),
                          child: Text('.', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.clear(),
                          child: Text('C', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.setOperator("+"),
                          child: Text('+', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.setDecimal(2),
                          child: Text("2dp", style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.setDecimal(4),
                          child: Text("4dp", style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.setDecimal(6),
                          child: Text("6dp", style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          onPressed: () => controller.calculate(),
                          child: Text('=', style: TextStyle(fontSize: buttonFontSize)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
