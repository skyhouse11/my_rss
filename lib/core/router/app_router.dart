import 'package:auto_route/auto_route.dart';
import 'package:my_rss/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: FolderRoute.page),
    AutoRoute(page: FeedRoute.page),
    AutoRoute(page: ItemRoute.page),
    AutoRoute(page: AddFeedRoute.page),
  ];
}
