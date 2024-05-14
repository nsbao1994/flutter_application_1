// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_application_1/main.dart';

void main() => runApp(const Solve2Screen());

class Solve2Screen extends StatelessWidget {
  const Solve2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giải phương trình bậc hai',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  String _result = '';

  void _calculateQuadraticEquation() {
    setState(() {
      double a = double.parse(_aController.text);
      double b = double.parse(_bController.text);
      double c = double.parse(_cController.text);

      double delta = b * b - 4 * a * c;

      if (delta > 0) {
        double x1 = (-b + sqrt(delta)) / (2 * a);
        double x2 = (-b - sqrt(delta)) / (2 * a);
        _result = 'Phương trình có hai nghiệm phân biệt:\nX1 = $x1\nX2 = $x2';
      } else if (delta == 0) {
        double x = -b / (2 * a);
        _result = 'Phương trình có nghiệm kép:\nX = $x';
      } else {
        _result = 'Phương trình vô nghiệm';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giải phương trình bậc hai'),
        backgroundColor: Colors.green.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _aController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nhập hệ số a',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _bController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nhập hệ số b',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _cController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nhập hệ số c',
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              _result,
              style: const TextStyle(fontSize: 15.0),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: _calculateQuadraticEquation,
              child: const Text('Giải'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              ),
              child: const Text('Quay lại'),
            ),
          ],
        ),
      ),
    );
  }
}
