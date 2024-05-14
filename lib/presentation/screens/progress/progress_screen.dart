import 'dart:math';

import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Circular Progress Indicator'),
          SizedBox(height: 20),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black87,
            color: Colors.amber,
            strokeCap: StrokeCap.butt,
          ),
          SizedBox(height: 20),
          Text('Circular Progress Controlled'),
          SizedBox(height: 20),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100; // 0.0, 1.0
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  backgroundColor: Colors.black87,
                  color: Colors.amber,
                  strokeCap: StrokeCap.butt,
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.black87,
                  color: Colors.amber,
                ))
              ],
            ),
          );
        });
  }
}
