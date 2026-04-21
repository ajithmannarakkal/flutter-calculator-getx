# Calculator App (GetX)

A calculator app built with Flutter and GetX for state management. Supports basic arithmetic, decimal precision control, calculation history, and dark/light theme.

## Features

- Addition, Subtraction, Multiplication, Division
- Chained operations (e.g. 12.5 + 5 × 2)
- Decimal precision setting (2, 4, or 6 decimal places)
- Calculation history (stored locally)
- Dark / Light theme toggle (persisted across sessions)
- Responsive layout for portrait and landscape

## How to Change Decimal Precision

The bottom row of the calculator has three buttons: **2dp**, **4dp**, and **6dp**. Tap any of them to change how many decimal places the result shows. For example, tapping **4dp** will display results with 4 decimal places. This setting is saved automatically using GetStorage, so it stays the same even after restarting the app.

## Project Structure

```
lib/
├── main.dart                          # App entry point, theme setup
├── controller/
│   └── calculator_controller.dart     # All business logic (GetxController)
└── view/
    └── calculator_screen.dart         # UI layer
```

## Packages Used

- [get](https://pub.dev/packages/get) – State management, navigation, snackbars
- [get_storage](https://pub.dev/packages/get_storage) – Local persistence

## Run the App

```bash
flutter pub get
flutter run
```
