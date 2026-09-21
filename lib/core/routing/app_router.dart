import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/features/categories/presentation/views/categories_screen.dart';
import 'package:masar/features/main_layout/views/main_view.dart';
import 'package:masar/features/notes/presentation/views/add_note_screen.dart';
import 'package:masar/features/notes/presentation/views/note_screen.dart';
import 'package:masar/features/notes/presentation/views/notes_screen.dart';
import 'package:masar/features/settings/presentation/views/settings_screen.dart';
import 'package:masar/features/tasks/presentation/views/add_task_screen.dart';
import 'package:masar/features/tasks/presentation/views/task_screen.dart';
import 'package:masar/features/tasks/presentation/views/tasks_screen.dart';

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
          MainScreen(navigationShell: navigationShell),
      branches: [
        // --Notes branch
        StatefulShellBranch(
          initialLocation: AppRoutes.notes,
          routes: [
            GoRoute(
              path: AppRoutes.notes,
              builder: (context, state) => const NotesScreen(),
            ),
                GoRoute(
              path: AppRoutes.note,
              builder: (context, state) => const NoteScreen(),
            ),
                            GoRoute(
              path: AppRoutes.addNote,
              builder: (context, state) => const AddNoteScreen(),
            ),
          ],
        ),
        // --Tasks branch
        StatefulShellBranch(
          initialLocation: AppRoutes.tasks,
          routes: [
            GoRoute(
              path: AppRoutes.tasks,
              builder: (context, state) => const TasksScreen(),
            ),
            GoRoute(path: AppRoutes.task, builder: (context, state) => const TaskScreen()),
            GoRoute(path: AppRoutes.addTask, builder: (context, state) => const AddTaskScreen()),
          ],
        ),
        // --Categories branch
        StatefulShellBranch(
          initialLocation: AppRoutes.categories,
          routes: [
            GoRoute(
              path: AppRoutes.categories,
              builder: (context, state) => const CategoriesScreen(),
            ),
          ],
        ),
        // --Settings branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),

  ],
);
