import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});
  static const name = 'animated_screen';

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50.0;

  double height = 50.0;

  Color color = Colors.red;

  double borderRadius = 10.0;

//Method to change sizes to the container below.
  void changeSizes() {
    final random = Random();

    width = random.nextInt(300) + 50;
    height = random.nextInt(500) + 50;
    borderRadius = random.nextInt(90) + 10;
    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Shape Screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Icon(Icons.play_arrow),
        onPressed: changeSizes,
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeInOutCubic,
          width: width,
          height: height,
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
