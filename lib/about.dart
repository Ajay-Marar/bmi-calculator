import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutScreen(),
    );
  }
}

class AboutScreen extends StatelessWidget {
  final List<String> categories = [
    "Developer Info",
    "About App",
    "Privacy Policy"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INFO"),
        backgroundColor: Color.fromARGB(255, 180, 143, 173),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Color.fromARGB(255, 165, 18, 99),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              // Use GridView.builder with shrinkWrap: true
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: categories.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigate to the CategoryDetailScreen with the selected category's description
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryDetailScreen(
                              categories[index], getCategoryDescription(index)),
                        ),
                      );
                    },
                    child: Card(
                      color: Color.fromARGB(255, 39, 1, 32),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getCategoryDescription(int index) {
    switch (index) {
      case 0:
        return "This is information about the developer.";
      case 1:
        return "App Name:  HEALTH DO  Description: The BMI Calculator app is a powerful and easy-to-use tool that helps you monitor your health by calculating your Body Mass Index (BMI). BMI is a widely accepted measurement for assessing whether you are underweight, normal weight, overweight, or obese based on your height and weight.\n\nKey Features: Simple Input, Instant Results, Interpretation.";
      case 2:
        return "This is the privacy policy.";
      default:
        return "";
    }
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final String title;
  final String description;

  CategoryDetailScreen(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 204, 226, 6),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Color.fromARGB(255, 131, 187, 197),
        child: Center(
          child: SingleChildScrollView(
            // Added SingleChildScrollView to allow scrolling if content overflows
            child: Text(
              description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
