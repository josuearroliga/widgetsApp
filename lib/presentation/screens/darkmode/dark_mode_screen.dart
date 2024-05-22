import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class DarkModeScreen extends ConsumerWidget {
  static const name = 'dark-mode-screen';
  const DarkModeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    //To checnge the darkmode state we need to check the main where we send the theme and color mode to the apptheme class.
    final isDarkMode = ref.watch(themeNotifierProvider).darkModeEnabled;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestor de Temas'),
        actions: [
          IconButton(
            icon: isDarkMode == true
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              /*  ref.read(isDarkModeEnabled.notifier).update((state) => !state); */
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
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
    // final selectedColor = ref.watch(colorSelectedProvider);
    //Ref for the color selection now.
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;

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
            /* ref
                .read(colorSelectedProvider.notifier)
                .update((state) => state = index); */
            ref.read(themeNotifierProvider.notifier).toggleColor(index);
          },
        );
      },
    );
  }
}
