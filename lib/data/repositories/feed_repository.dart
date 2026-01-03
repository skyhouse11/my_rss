import 'package:command_it/command_it.dart';
import 'package:my_rss/data/database/daos/feed_dao.dart';
import 'package:my_rss/data/database/extensions/feed_table_data_x.dart';
import 'package:my_rss/domain/models/feed.dart';
import 'package:rss_dart/dart_rss.dart';

class FeedRepository {
  FeedRepository({required this.feedDao});

  final FeedDao feedDao;
  final ListNotifier<Feed> feeds = ListNotifier<Feed>(data: []);

  late final loadFeedsCommand = Command.createAsyncNoParamNoResult(() async {
    feeds.clear();

    final data = await feedDao.getAllFeeds();
    for (final data in data) {
      feeds.add(data.toFeed());
    }
  });

  late final createFeedCommand = Command.createAsyncNoResult(
    (RssFeed feed) async {
      await feedDao.createFeed(
        url: feed.link ?? '',
        title: feed.title ?? 'No title',
        folderId: feed.categories.firstOrNull?.value,
        description: feed.description,
      );

      loadFeedsCommand.run();
    },
  );

  late final deleteFeedCommand = Command.createAsyncNoResult(
    (Feed feed) async {
      await feedDao.deleteFeed(feed.id);
      loadFeedsCommand.run();
    },
  );

  late final updateFeedCommand = Command.createAsyncNoResult(
    (Feed feed) async {
      await feedDao.updateFeed(
        id: feed.id,
        title: feed.title,
        description: feed.description,
        folderId: feed.folderId,
        autoFetch: feed.autoFetch,
      );
      loadFeedsCommand.run();
    },
  );

  late final setFeedAsFavorite = Command.createAsyncNoResult(
    (Feed feed) async {
      await feedDao.updateFeed(
        id: feed.id,
        autoFetch: true,
      );
      loadFeedsCommand.run();
    },
  );
}
