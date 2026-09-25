import 'package:get_it/get_it.dart';
import 'package:masar/core/database/datebase_service.dart';
import 'package:masar/core/database/hive_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
// -- Services
getIt.registerSingleton<DatabaseService>(HiveService());
await getIt<DatabaseService>().init();
//-- Repositories

}