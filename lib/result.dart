import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String result;

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    Color progressBarColor = Colors.green; // Default color for Normal Weight

    double bmi = double.parse(result);
    if (bmi < 18.5) {
      progressBarColor = Colors.red; // Underweight
    } else if (bmi < 24.9) {
      progressBarColor = Colors.green; // Normal Weight
    } else if (bmi < 29.9) {
      progressBarColor = Colors.yellow; // Overweight
    } else {
      progressBarColor = Colors.red; // Obese
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
        backgroundColor: const Color.fromARGB(255, 39, 1, 32),
      ),
      body: Container(
        color: const Color.fromARGB(255, 39, 1, 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your BMI is",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _interpretBMI(bmi),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: _calculateProgress(bmi),
                valueColor: AlwaysStoppedAnimation<Color>(progressBarColor),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Back to the previous screen
                },
                child: const Text("RE-CALCULATE"),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF2196F3),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _calculateProgress(double bmi) {
    if (bmi < 18.5) {
      return 0.2; // Underweight
    } else if (bmi < 24.9) {
      return 0.5; // Normal Weight
    } else if (bmi < 29.9) {
      return 0.7; // Overweight
    } else {
      return 0.9; // Obese
    }
  }

  String _interpretBMI(double bmi) {
    String interpretation;

    if (bmi < 18.5) {
      interpretation = "Underweight 😟";
    } else if (bmi < 24.9) {
      interpretation = "Normal Weight 😊";
    } else if (bmi < 29.9) {
      interpretation = "Overweight 😞";
    } else {
      interpretation = "Obese 😢";
    }

    return interpretation;
  }
}
