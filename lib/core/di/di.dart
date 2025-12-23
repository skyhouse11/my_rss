import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_rss/core/di/di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true, // default
)
void configureDependencies() => getIt.init();
