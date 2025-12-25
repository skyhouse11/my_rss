import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/domain/models/feed_item.dart';

extension FeedItemCompanion on FeedItem {
  FeedItemsTableCompanion toCompanion() {
    return FeedItemsTableCompanion(
      id: Value(id),
      feedId: Value(feedId),
      title: Value(title),
      url: Value(url),
      publishedAt: Value(publishedAt ?? DateTime.now()),
      description: Value(description ?? ''),
      isRead: Value(isRead),
      createdAt: Value(createdAt ?? DateTime.now()),
    );
  }

  FeedItem fromCompanion(FeedItemsTableData data) {
    return FeedItem(
      id: data.id,
      feedId: data.feedId,
      title: data.title,
      url: data.url,
      description: data.description,
      publishedAt: data.publishedAt,
      isRead: data.isRead,
      createdAt: data.createdAt,
    );
  }
}
