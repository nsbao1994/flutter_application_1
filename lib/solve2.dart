import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  runApp(const Solve2());
}

class Solve2 extends StatelessWidget {
  const Solve2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chương trình tính phương trình bật hai',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade100),
        useMaterial3: true,
      ),
      home: const Solve2Screen(),
    );
  }
}

class Solve2Screen extends StatefulWidget {
  const Solve2Screen({super.key});

  @override
// ignore: library_private_types_in_public_api
  _Solve2ScreenState createState() => _Solve2ScreenState();
}

class _Solve2ScreenState extends State<Solve2Screen> {
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();
  TextEditingController controllerC = TextEditingController();
  String solution = '';
  // ignore: non_constant_identifier_names
  void SolveQuest() {
    double a = double.tryParse(controllerA.text) ?? 0;
    double b = double.tryParse(controllerB.text) ?? 0;
    double c = double.tryParse(controllerC.text) ?? 0;
    double delta = b * b - 4 * a * c;
    if (delta < 0) {
      setState(() {
        solution = 'Phương trình vô nghiệm';
      });
    } else if (delta == 0) {
      double x = -b / (2 * a);
      setState(() {
        solution = 'Phương trình có nghiệm kép là: x= $x';
      });
    } else {
      double x1 = (-b + sqrt(delta)) / (2 * a);
      double x2 = (-b - sqrt(delta)) / (2 * a);
      setState(() {
        solution =
            'Nghiệm của phương trình là: x=$x1, Nghiệm của phương trình là: x2 = $x2';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Phương trình bật nhất'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controllerA,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nhập số a'),
            ),
            TextField(
              controller: controllerB,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nhập số b'),
            ),
            TextField(
              controller: controllerC,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nhập số c'),
            ),
            Text(
              solution,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: SolveQuest,
              child: const Text('Giải'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              ),
              child: const Text('Quay lại'),
            ),
            const SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
