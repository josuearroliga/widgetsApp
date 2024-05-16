import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contendedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Indicadores de Progreso',
    subTitle: 'Indicadores estaticos y controlados.',
    link: '/progress',
    icon: Icons.restart_alt_outlined,
  ),
  MenuItem(
    title: 'Snackbar Pop Up',
    subTitle: 'Indicador de Snackbar o Pop Up',
    link: '/snackbar',
    icon: Icons.remove_red_eye_outlined,
  ),
  MenuItem(
    title: 'Contenedor Animado',
    subTitle: 'Interactua con el contenedor presionando el boton.',
    link: '/animated',
    icon: Icons.square_outlined,
  ),
  MenuItem(
    title: 'Controles de UI',
    subTitle: 'Explora las formas de intractuar con el UI.',
    link: '/ui_controls',
    icon: Icons.ac_unit_outlined,
  ),
  MenuItem(
    title: 'Guia de usuario',
    subTitle: 'Bienvenido a la guia inicial de usuario.',
    link: '/app_tutorial',
    icon: Icons.accessibility_new_outlined,
  ),
];
