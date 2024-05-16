import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controles de UI'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

//Definiendo posibles valores de los seleccion multiples.
enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  //Defining a default value, if not, make sure to prevent null.
  Transportation selectedTransp = Transportation.car;
  //Variables for the checkboxes
  bool wantsBreakFast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

//////////////
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales.'),
          value: isDeveloper,
          onChanged: (value) => setState(
            () {
              isDeveloper = !isDeveloper;
            },
          ),
        ),
        RadioListTile(
          title: const Text('Ir por carro.'),
          subtitle: const Text('Toque paara seleccionar ir por carro.'),
          value: Transportation.car,
          groupValue: selectedTransp,
          onChanged: (value) => setState(
            () {
              selectedTransp = Transportation.car;
            },
          ),
        ),
        ExpansionTile(
          title: Text('Seleccione medio de transporte:'),
          subtitle: Text('$selectedTransp '),
          children: [
            RadioListTile(
              title: const Text('Ir por bote.'),
              subtitle: const Text('Toque paara seleccionar ir por bote.'),
              value: Transportation.boat,
              groupValue: selectedTransp,
              onChanged: (value) => setState(
                () {
                  selectedTransp = Transportation.boat;
                },
              ),
            ),
            RadioListTile(
              title: const Text('Ir por avion.'),
              subtitle: const Text('Toque paara seleccionar ir por avion.'),
              value: Transportation.plane,
              groupValue: selectedTransp,
              onChanged: (value) => setState(
                () {
                  selectedTransp = Transportation.plane;
                },
              ),
            ),
            RadioListTile(
              title: const Text('Ir por submarino.'),
              subtitle: const Text('Toque paara seleccionar ir por submarino.'),
              value: Transportation.submarine,
              groupValue: selectedTransp,
              onChanged: (value) => setState(
                () {
                  selectedTransp = Transportation.submarine;
                },
              ),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text(' Quiere Desayuno?'),
          value: wantsBreakFast,
          onChanged: (value) => setState(
            () {
              wantsBreakFast = !wantsBreakFast;
            },
          ),
        ),
        CheckboxListTile(
          title: const Text(' Quiere Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(
            () {
              wantsLunch = !wantsLunch;
            },
          ),
        ),
        CheckboxListTile(
          title: const Text(' Quiere Cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(
            () {
              wantsDinner = !wantsDinner;
            },
          ),
        ),
      ],
    );
  }
}
