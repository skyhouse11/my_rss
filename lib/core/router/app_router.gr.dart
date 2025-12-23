// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:my_rss/presentation/add_feed_page.dart' as _i1;
import 'package:my_rss/presentation/feed_page.dart' as _i2;
import 'package:my_rss/presentation/folder_page.dart' as _i3;
import 'package:my_rss/presentation/home_page.dart' as _i4;
import 'package:my_rss/presentation/item_page.dart' as _i5;

/// generated route for
/// [_i1.AddFeedPage]
class AddFeedRoute extends _i6.PageRouteInfo<void> {
  const AddFeedRoute({List<_i6.PageRouteInfo>? children})
    : super(AddFeedRoute.name, initialChildren: children);

  static const String name = 'AddFeedRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddFeedPage();
    },
  );
}

/// generated route for
/// [_i2.FeedPage]
class FeedRoute extends _i6.PageRouteInfo<void> {
  const FeedRoute({List<_i6.PageRouteInfo>? children})
    : super(FeedRoute.name, initialChildren: children);

  static const String name = 'FeedRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.FeedPage();
    },
  );
}

/// generated route for
/// [_i3.FolderPage]
class FolderRoute extends _i6.PageRouteInfo<void> {
  const FolderRoute({List<_i6.PageRouteInfo>? children})
    : super(FolderRoute.name, initialChildren: children);

  static const String name = 'FolderRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.FolderPage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.ItemPage]
class ItemRoute extends _i6.PageRouteInfo<void> {
  const ItemRoute({List<_i6.PageRouteInfo>? children})
    : super(ItemRoute.name, initialChildren: children);

  static const String name = 'ItemRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.ItemPage();
    },
  );
}
