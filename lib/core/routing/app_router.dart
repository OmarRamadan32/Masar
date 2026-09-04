
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/features/main_layout/views/main_view.dart';
import 'package:masar/features/notes/presentation/views/notes_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/*
Every branch has its own pages as routes(the first route is the default page-the branch main page-)
...
*/

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.notes,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainScreen(navigationShell: navigationShell,
          ),
      branches: [
        // --Notes branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.notes,
              builder: (context, state) => const NotesScreen(),
            ),
          ],
        ),
        // --Tasks branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.tasks,
              builder: (context, state) => const Center(child: Text("1")),
            ),
          ],
        ),
        // --Categories branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.categories,
              builder: (context, state) => const Center(child: Text("2")),
            ),
          ],
        ),
        // --Settings branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const Center(child: Text("3")),
            ),
          ],
        ),
      ],
    ),
  ],
);
