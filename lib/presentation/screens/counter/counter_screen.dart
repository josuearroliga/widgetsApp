import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/counter_provider.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

//We change stateless to consumer for Riverpod
class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  final int currentNumber = 10;
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //We ask the Riverpod Provider to be on top of any changes to counter provider.
    final clickCounter = ref.watch(counterProvider);
    final darkModeEnabler = ref.watch(isDarkModeEnabled);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Testing'),
        actions: [
          IconButton(
            icon: darkModeEnabler == true
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeEnabled.notifier).update((state) => !state);
              //print(darkModeEnabler);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Icon(Icons.add),
        onPressed: () {
          //First way to change the state.
          ref.read(counterProvider.notifier).state++;
          //Second option.
          //ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
      body: Center(
        child: Text(
          //Clickcounter is the value that the riverpod provider has, originally 0 but changing and notifying the watch method inside this build context.
          'Valor: $clickCounter',
          style: const TextStyle(fontSize: 49),
        ),
      ),
    );
  }
}
