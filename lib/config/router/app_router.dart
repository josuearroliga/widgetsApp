import 'package:go_router/go_router.dart';
import 'package:widget_app/presentation/screens/screens_exports.dart';

//To implement go router you go to the main and add .router to the material app, then you add the "routerConfig" setting to this andyou selectappRouter.

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);
