import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calculator_controller.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorController get controller => Get.find<CalculatorController>();

  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => IconButton(
              onPressed: () => controller.toggleTheme(),
              icon: Icon(
                controller.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                backgroundColor: Get.isDarkMode
                    ? Colors.grey[900]
                    : Colors.white,
                builder: (_) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: EdgeInsets.all(16),
                    child: Obx(() {
                      if (controller.history.isEmpty) {
                        return Center(child: Text("No calculations yet"));
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
                  );
                },
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
          double buttonFontSize =
              constraints.maxWidth * (isLandscape ? 0.03 : 0.045);

          double gridHeight =
              (constraints.maxHeight * gridFlex / (displayFlex + gridFlex)) -
              12;
          double cellWidth = constraints.maxWidth / 4;
          double cellHeight = gridHeight / 5;
          double aspectRatio = cellWidth / cellHeight;

          return Column(
            children: [
              Expanded(
                flex: displayFlex,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(isLandscape ? 8 : 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Obx(
                          () => Text(
                            controller.expression.value,
                            style: TextStyle(
                              fontSize: displayFontSize * 0.5,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Obx(
                          () => Text(
                            controller.input.value,
                            style: TextStyle(
                              fontSize: displayFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      CalculatorButton(
                        label: "7",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("7"),
                      ),
                      CalculatorButton(
                        label: "8",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("8"),
                      ),
                      CalculatorButton(
                        label: "9",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("9"),
                      ),
                      CalculatorButton(
                        label: "÷",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.setOperator("/"),
                      ),
                      CalculatorButton(
                        label: "4",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("4"),
                      ),
                      CalculatorButton(
                        label: "5",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("5"),
                      ),
                      CalculatorButton(
                        label: "6",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("6"),
                      ),
                      CalculatorButton(
                        label: "×",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.setOperator("*"),
                      ),
                      CalculatorButton(
                        label: "1",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("1"),
                      ),
                      CalculatorButton(
                        label: "2",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("2"),
                      ),
                      CalculatorButton(
                        label: "3",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("3"),
                      ),
                      CalculatorButton(
                        label: "-",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.setOperator("-"),
                      ),
                      CalculatorButton(
                        label: "0",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("0"),
                      ),
                      CalculatorButton(
                        label: ".",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.appendValue("."),
                      ),
                      CalculatorButton(
                        label: "C",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.clear(),
                      ),
                      CalculatorButton(
                        label: "+",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.setOperator("+"),
                      ),
                      CalculatorButton(
                        label: "2dp",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.setDecimal(2),
                      ),
                      CalculatorButton(
                        label: "4dp",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.setDecimal(4),
                      ),
                      CalculatorButton(
                        label: "6dp",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.setDecimal(6),
                      ),
                      CalculatorButton(
                        label: "=",
                        fontSize: buttonFontSize,
                        onPressed: () => controller.calculate(),
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
