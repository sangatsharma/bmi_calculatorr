import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Widgets/IconContent.dart';
import 'Widgets/ReusableCard.dart';
import 'Widgets/Down_btn.dart';
import 'package:bmi_calculatorr/Result_Page.dart';
import 'package:flash/flash.dart';
import 'dart:math';

const Color activeColor = Colors.white38;
const Color inActiveColor = Colors.white10;
const Color activeText = Colors.white;
const Color inActiveText = Colors.white;
int userHeight = 180;
int userWeight = 65;
int userAge = 20;
String bmiValue = '20';
String index = ' ';
String advice = '';

//Bmi calculating function

void bmiCalculator(int height, int weight) {
  double bmi = (weight / pow(height / 100, 2));
  bmiValue = (weight / pow(height / 100, 2)).toStringAsFixed(1);
  if (bmi < 18.5) {
    index = 'Underweight';
    advice = 'your BMI is below 18.5. Please take proper diet.';
  } else if (bmi > 24.9) {
    index = 'Overweight';
    advice =
        'your BMI is above 24.9. Please lower your diet and exercise regularly.';
  } else {
    index = 'Normal';
    advice = 'Great ! your BMI is normal.';
  }
}

enum GenderType { male, female, notSelected }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GenderType selectedGender = GenderType.notSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.greenAccent,
                width: 2,
                style: BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.black26,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                heightFactor: 2,
                widthFactor: 1.3,
                child: Text(
                  'BMI CALCULATOR',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == GenderType.male
                            ? activeColor
                            : inActiveColor,
                        childContent: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: IconContent(
                            getIcon: FontAwesomeIcons.mars,
                            getText: 'Male',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == GenderType.female
                            ? activeColor
                            : inActiveColor,
                        childContent: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: IconContent(
                            getIcon: FontAwesomeIcons.venus,
                            getText: 'Female',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveColor,
                      childContent: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Height',
                                style: TextStyle(fontSize: 20),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.baseline,
                                // textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    userHeight.toString(),
                                    style: const TextStyle(
                                        fontSize: 45,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'cm',
                                    style: TextStyle(fontSize: 25),
                                  )
                                ],
                              ),
                              Slider(
                                value: userHeight.toDouble(),
                                max: 250,
                                min: 50,
                                label: userHeight.round().toString(),
                                onChanged: (double newValue) {
                                  setState(() {
                                    userHeight = newValue.toInt();
                                  });
                                },
                                activeColor: Colors.greenAccent,
                                inactiveColor: Colors.green[200],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveColor,
                      childContent: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Weight',
                                style: TextStyle(fontSize: 20),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      userWeight.toString(),
                                      style: const TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'kg',
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ]),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyRoundButton(
                                        myIcon: Icons.add,
                                        onPressed: () {
                                          setState(() {
                                            if (userWeight < 150) userWeight++;
                                          });
                                        }),
                                    MyRoundButton(
                                        myIcon: Icons.remove,
                                        onPressed: () {
                                          setState(() {
                                            if (userWeight > 1) userWeight--;
                                          });
                                        }),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveColor,
                      childContent: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Age',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                userAge.toString(),
                                style: const TextStyle(
                                    fontSize: 45, fontWeight: FontWeight.w900),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyRoundButton(
                                        myIcon: Icons.add,
                                        onPressed: () {
                                          setState(() {
                                            if (userAge < 100) userAge++;
                                          });
                                        }),
                                    MyRoundButton(
                                        myIcon: Icons.remove,
                                        onPressed: () {
                                          setState(() {
                                            if (userAge > 1) userAge--;
                                          });
                                        }),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            DownButton(
              btnName: 'Calculate',
              onPressed: () {
                if (selectedGender == GenderType.notSelected) {
                  context.showInfoBar(
                      content: const Text('Please Select your Gender'),
                      position: FlashPosition.top);
                } else {
                  bmiCalculator(userHeight, userWeight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ResultPage();
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyRoundButton extends StatelessWidget {
  const MyRoundButton({Key? key, required this.myIcon, required this.onPressed})
      : super(key: key);
  final IconData myIcon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: const Color(0xFFEFEBE9),
      child: Icon(
        myIcon,
        size: 35,
        color: Colors.black,
      ),
    );
  }
}
