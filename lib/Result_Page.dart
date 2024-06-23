import 'package:bmi_calculatorr/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculatorr/Widgets/Down_btn.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 210,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              index,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: index == 'Normal'
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              bmiValue,
                              style: TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: index == 'Normal'
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                advice,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            DownButton(
                btnName: 'Re-Calculate',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
