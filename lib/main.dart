import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CounterLabel()));
}

const int waitSeconds = 1;

class CounterLabel extends StatefulWidget {
  CounterLabel({super.key});
  int count = 0;

  @override
  State<CounterLabel> createState() => _CounterLabelState();
}

class _CounterLabelState extends State<CounterLabel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(
          widget.count.toString(),
          style: const TextStyle(fontSize: 52),
        ),
        TextButton(
          child: const Text("カウントスタート"),
          onPressed: () => startCount(),
        )
      ],
    ));
  }

  Future<void> startCount() async {
    for (int i = 0; i <= 10; i++) {
      await count(i);
    }
  }

  Future<void> count(int i) async {
    await Future.delayed(const Duration(seconds: waitSeconds));
    setState(() {
      widget.count += i;
    });
  }
}
