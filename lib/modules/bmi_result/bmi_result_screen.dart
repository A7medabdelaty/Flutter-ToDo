import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  final bool isMale;
  final int age;
  final double result;

  const BMIResult(
      {required this.age, required this.isMale, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('BMI result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender: ${isMale ? 'Male' : 'Female'}',
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
            Text(
              'Age: $age',
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
            Text(
              'Result: ${result.round()}',
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
