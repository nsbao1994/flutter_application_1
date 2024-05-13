import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  runApp(const Solve1());
}

class Solve1 extends StatelessWidget {
  const Solve1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chương trình tính phương trình bật nhất',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade100),
        useMaterial3: true,
      ),
      home: const Solve1Screen(),
    );
  }
}

class Solve1Screen extends StatefulWidget {
  const Solve1Screen({super.key});

  @override
// ignore: library_private_types_in_public_api
  _Solve1ScreenState createState() => _Solve1ScreenState();
}

class _Solve1ScreenState extends State<Solve1Screen> {
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();

  String solution = '';
  // ignore: non_constant_identifier_names
  void SolveQuest() {
    double a = double.tryParse(controllerA.text) ?? 0;
    double b = double.tryParse(controllerB.text) ?? 0;

    if (a == 0) {
      setState(() {
        solution = 'Phương trình không phải là phương trình bật nhất';
      });
    } else {
      double x = -b / a;
      setState(() {
        solution = 'Nghiệm của phương trình là: x= $x';
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
            const SizedBox(
              height: 25.0,
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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
