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
}

extension FeedTableDataMapper on FeedTableData {
  Feed toModel() {
    return Feed(
      id: id,
      title: title ?? '',
      url: url,
      description: description,
      lastUpdatedAt: lastUpdatedAt,
      createdAt: createdAt,
    );
  }
} 
