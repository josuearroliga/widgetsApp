import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int drawerIndex = 1;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: drawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          drawerIndex = value;
        });
      },
      children: const [
        NavigationDrawerDestination(
          icon: Icon(Icons.add),
          label: Text('Another item'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.deck_rounded),
          label: Text('Another One'),
        ),
      ],
    );
  }
}
