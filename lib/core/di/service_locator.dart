import 'package:get_it/get_it.dart';
import 'package:my_rss/data/database/tables/database.dart';

final GetIt getIt = GetIt.instance;

/// Initialize all services for dependency injection
Future<void> setupServiceLocator() async {
  // Database (singleton - single instance for entire app)
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  // DAOs are accessed through AppDatabase
  // Example: getIt<AppDatabase>().categoryDao

  // TODO(Repository): Add Repositories here
  // getIt.registerSingleton<CategoryRepository>(
  //   CategoryRepository(getIt<AppDatabase>()),
  // );
}
