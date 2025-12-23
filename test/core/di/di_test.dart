import 'package:flutter_test/flutter_test.dart';
import 'package:my_rss/core/di/di.dart';
import 'package:my_rss/core/router/app_router.dart';

void main() {
  test('AppRouter resolves from DI', () async {
    configureDependencies();
    final router = getIt<AppRouter>();
    expect(router, isA<AppRouter>());
  });
}
