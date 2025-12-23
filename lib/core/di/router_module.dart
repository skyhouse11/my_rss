import 'package:injectable/injectable.dart';
import 'package:my_rss/core/router/app_router.dart';

@module
abstract class RouterModule {
  @singleton
  AppRouter get appRouter => AppRouter();
}
