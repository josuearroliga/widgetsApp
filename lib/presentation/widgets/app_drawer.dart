import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  //Receivong the key from the main page to know that drawer state.
  final GlobalKey<ScaffoldState> scaffoldState;
  const SideMenu({super.key, required this.scaffoldState});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int drawerIndex = 1;
  @override
  Widget build(BuildContext context) {
    //Working with the distance between the drawer widgets and the notch.
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
      selectedIndex: drawerIndex,
      onDestinationSelected: (value) {
        setState(
          () {
            drawerIndex = value;

            final itemPosition = appMenuItems[value];
            context.push(itemPosition.link);
            widget.scaffoldState.currentState?.closeDrawer();
          },
        );
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 5 : 20, 16, 10),
          child: const Text(
            'Main Menu',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        ...appMenuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 5 : 20, 16, 10),
          child: const Text(
            'Secondary Menu',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        ...appMenuItems.sublist(3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
