import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/features/main_layout/views/main_view.dart';

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
              builder: (context, state) => const SizedBox(),
            ),
          ],
        ),
        // --Tasks branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.tasks,
              builder: (context, state) => const SizedBox(),
            ),
          ],
        ),
        // --Categories branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.categories,
              builder: (context, state) => const SizedBox(),
            ),
          ],
        ),
        // --Settings branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const SizedBox(),
            ),
          ],
        ),
      ],
    ),
  ],
);
