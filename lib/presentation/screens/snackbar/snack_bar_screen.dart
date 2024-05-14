import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snack_bar_screen';

  const SnackBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar Screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              child: const Text('Licencias Usadas'),
              onPressed: () => showLicenses(context),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar Dialogo'),
            ),
          ],
        ),
      ),

      //Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show Snack Bar'),
        icon: const Icon(Icons.remove_red_eye_rounded),
        onPressed: () {
          //In case the user double presses the button, it will not look like a glitch by clearing an existing snackbar before showing a new one.
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Snack Bar Test'),
              action: SnackBarAction(label: 'Close', onPressed: () {}),
            ),
          );
        },
      ),
    );
  }
}

//Clase para mostrar licencias.
void showLicenses(BuildContext context) {
  showAboutDialog(
    context: context,
    applicationName: 'Licencias Usadas',
    children: [
      const Text(
          'Licencias usadas al momento de desarrollar esta aplicacion usando la tecnologia de Flutter por Josue Arroliga en Mayo 14 del 2024.'),
    ],
  );
}

//Clase para mostrar dialogo.
void openDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      actions: [
        TextButton(
          onPressed: () => context.pop(context),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () => context.pop(context),
          child: const Text('Aceptar'),
        ),
      ],
      title: const Text('Pantalla de Dialogo'),
      content: const Text(
          'Aliquip excepteur reprehenderit occaecat dolor aliqua reprehenderit elit irure qui enim. Id ullamco laboris minim anim voluptate exercitation non consequat cillum amet esse eu. Tempor do ut cillum velit elit do mollit sunt laboris sunt pariatur aliquip. Aliquip deserunt ex sit sit do velit eu non tempor consectetur deserunt sit velit id. Quis Lorem deserunt qui velit veniam consectetur.'),
    ),
  );
}
