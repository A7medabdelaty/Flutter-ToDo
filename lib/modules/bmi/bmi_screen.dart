import 'dart:math';

import 'package:first_project/modules/bmi_result/bmi_result_screen.dart';
import 'package:flutter/material.dart';

bool isMale = true;
double height = 160;
Color? bgColor = Colors.grey[400];
int age = 18;
int weight = 75;

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: isMale ? Colors.blue : bgColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage('assets/images/male.png'),
                                width: 90.0,
                                height: 90.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ), //male container
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: isMale ? bgColor : Colors.blue,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage('assets/images/female.png'),
                                width: 90.0,
                                height: 90.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ), //female container
                  ],
                ),
              ),
            ), //first row
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: bgColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 35.0),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            'CM',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Slider(
                          value: height,
                          min: 80.0,
                          max: 220.0,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ), //second row
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: bgColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$age',
                              style: const TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'age-',
                                  onPressed: () {
                                    setState(() {
                                      if (age > 10) {
                                        age--;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  heroTag: 'age+',
                                  onPressed: () {
                                    setState(() {
                                      if (age < 90) {
                                        age++;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: bgColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Weight',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$weight',
                              style: const TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'weight-',
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 40) {
                                        weight--;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  heroTag: 'weight+',
                                  onPressed: () {
                                    setState(() {
                                      if (weight < 200) {
                                        weight++;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), //third row
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: MaterialButton(
                color: Colors.blue,
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                onPressed: () {
                  var result = weight / pow(height / 100, 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMIResult(age: age,isMale: isMale,result: result),
                      ));
                },
              ),
            ), //button
          ],
        ));
  }
}
