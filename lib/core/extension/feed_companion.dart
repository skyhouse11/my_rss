import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/domain/models/feed.dart';

extension FeedToCompanion on Feed {
  FeedTableCompanion toCompanion() {
    return FeedTableCompanion(
      id: Value(id),
      title: Value(title),
      url: Value(url),
      description: Value(description),
      lastUpdatedAt: Value(lastUpdatedAt),
      createdAt: Value(createdAt ?? DateTime.now()),
    );
  }

  Feed fromCompanion(FeedTableData data) {
    return Feed(
      id: data.id,
      title: data.title ?? '',
      url: data.url,
      description: data.description,
      lastUpdatedAt: data.lastUpdatedAt,
      createdAt: data.createdAt,
    );
  }
}
