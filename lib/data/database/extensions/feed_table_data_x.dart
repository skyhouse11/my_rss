import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/domain/models/feed.dart';

extension FeedTableDataX on FeedTableData {
  Feed toFeed() => Feed(
    id: id,
    title: title ?? 'No title',
    url: url,
    folderId: folderId,
    description: description,
    createdAt: createdAt,
    lastUpdatedAt: lastUpdatedAt,
    autoFetch: autoFetch,
  );
}
