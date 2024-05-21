import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class DarkModeScreen extends ConsumerWidget {
  static const name = 'dark-mode-screen';
  const DarkModeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(isDarkModeEnabled);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestor de Temas'),
        actions: [
          IconButton(
            icon: isDarkMode == true
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeEnabled.notifier).update((state) => !state);
              //print(darkModeEnabler);
            },
          )
        ],
      ),
      body: _ThemeSelector(),
    );
  }
}

class _ThemeSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    //Riverpod Provider para tener acceso a la lista de colores creada en el provider.
    final colors = ref.watch(colorListProvider);
    //Provider para vigilar los cambios en el selectedColor.
    final selectedColor = ref.watch(colorSelectedProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text(
            'Este color:',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          activeColor: colors[index],
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            //Assigning the index value to the new state of the colorSelectedProvider.
            ref
                .read(colorSelectedProvider.notifier)
                .update((state) => state = index);
          },
        );
      },
    );
  }
}
