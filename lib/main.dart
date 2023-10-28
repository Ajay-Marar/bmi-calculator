import 'package:flutter/material.dart';
import 'package:healthdo/about.dart';
import 'package:healthdo/result.dart';
import 'package:healthdo/welcome.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int currentIndex = 0;
  String result = "";
  double height = 0;
  double weight = 0;

  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 1, 32),
        appBar: AppBar(
          title: const Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Color.fromARGB(255, 225, 176, 234)),
          ),
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 9, 4, 53),
          actions: [
            IconButton(
              onPressed: () {
                // Navigate to the About Developer screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
              icon: const Icon(Icons.info_outline,
                  color: Color.fromARGB(241, 238, 237, 237)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "YOUR HEIGHT IN CM :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 11.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightcontroller,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "ENTER YOUR HEIGHT",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 25, 25, 25),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "YOUR WEIGHT IN KG :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 11.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightcontroller,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "ENTER YOUR WEIGHT",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 25, 25, 25),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 55.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF2196F3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      // Check for valid height and weight input
                      if (isValidInput()) {
                        setState(() {
                          height = double.parse(heightcontroller.value.text);
                          weight = double.parse(weightcontroller.value.text);
                        });
                        calculateBMI(height, weight);
                      } else {
                        // Show an alert if height or weight is not valid
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content:
                                  Text("Please enter valid height and weight"),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "CALCULATE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidInput() {
    return height > 0 && weight > 0;
  }

  void calculateBMI(double height, double weight) {
    double finalResult = weight / ((height * height) / 10000);
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });

    // Navigate to the result screen with the calculated BMI
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ResultScreen(result: bmi),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 70.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: currentIndex == index ? color : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentIndex == index
                  ? Colors.white
                  : const Color.fromARGB(255, 34, 34, 35),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
