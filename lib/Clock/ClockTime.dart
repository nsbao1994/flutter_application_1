import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

void main() {
  runApp(const MaterialApp(
    home: ClockTimeCountDown(),
  ));
}

class ClockTimeCountDown extends StatefulWidget {
  const ClockTimeCountDown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClockTimeCountDownState createState() => _ClockTimeCountDownState();
}

class _ClockTimeCountDownState extends State<ClockTimeCountDown> {
  int _endTime = DateTime.now().millisecondsSinceEpoch;

  void _startCountdown(int minutes) {
    setState(() {
      _endTime = DateTime.now().millisecondsSinceEpoch + minutes * 60000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đồng hồ đếm ngược"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nhập số phút',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                int minutes = int.tryParse(value) ?? 0;
                _startCountdown(minutes);
              },
            ),
            const SizedBox(height: 20),
            CountdownTimer(
              endTime: _endTime,
              textStyle: const TextStyle(fontSize: 30, color: Colors.red),
              onEnd: () {
                // ignore: avoid_print
                print('end');
                // Thực hiện hành động khi đồng hồ đếm ngược kết thúc
              },
            ),
          ],
        ),
      ),
    );
  }
}
