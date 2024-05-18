import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/presentation/widgets/app_drawer.dart';

import '../../../config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //We define a key to assign it to the scaffold who is the one that opens the side bar, this way we can pass the scaffold state to close the side bar.
    final scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: const Text('Multi-function App'),
      ),
      body: _HomeView(),
      drawer: SideMenu(scaffoldState: scaffoldState),
    );
  }
}

class _HomeView extends StatelessWidget {
  final listViewLenght = appMenuItems.length;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: listViewLenght,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}
