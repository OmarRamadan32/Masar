import 'package:get_it/get_it.dart';
import 'package:masar/core/database/datebase_service.dart';
import 'package:masar/core/database/hive_service.dart';
import 'package:masar/features/categories/data/repos/categories_repo.dart';
import 'package:masar/features/categories/data/repos/categories_repo_impl.dart';
import 'package:masar/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:masar/features/notes/data/repo/notes_repo.dart';
import 'package:masar/features/notes/data/repo/notes_repo_impl.dart';
import 'package:masar/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:masar/features/tasks/data/repos/task_repo_impl.dart';
import 'package:masar/features/tasks/data/repos/tasks_repo.dart';
import 'package:masar/features/tasks/presentation/cubit/tasks_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // -- Services
  getIt.registerSingleton<DatabaseService>(HiveService());
  var databaseService = getIt<DatabaseService>();
  await databaseService.init();
  //-- Repositories
  getIt.registerLazySingleton<NotesRepo>(
    () => NotesRepoImpl(databaseService: databaseService),
  );
  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImpl(databaseService: databaseService),
  );
  getIt.registerLazySingleton<TasksRepo>(() => TaskRepoImpl(
    databaseService: databaseService,
  ));

  //-- Cubits
  getIt.registerFactory<NotesCubit>(
    () => NotesCubit(notesRepo: getIt<NotesRepo>()),
  );
  getIt.registerFactory(
    () => CategoriesCubit(categoriesRepo: getIt<CategoriesRepo>()),
  );
  getIt.registerFactory(
    () => TasksCubit(tasksRepo: getIt<TasksRepo>()),
  );
}
