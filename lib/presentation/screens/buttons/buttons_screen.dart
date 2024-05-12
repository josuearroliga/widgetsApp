import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonView(),
    );
  }
}

class _ButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lenght = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: lenght - (lenght * 0.98), vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.alarm_add_outlined),
              label: const Text('Elevated Icon'),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.label_important_outlined),
              label: const Text('Filled Icon'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outline'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.baby_changing_station_outlined),
              label: const Text('Outline Icon'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.kayaking_outlined),
              label: const Text('Text Icon'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_blocking_outlined),
            ),
            IconButton.filled(
              onPressed: () {},
              icon: const Icon(Icons.cached_outlined),
            ),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      borderRadius: BorderRadius.circular(20),
      color: colors.primary,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.red,
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Hola Mundo',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
