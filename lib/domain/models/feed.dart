import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_rss/core/helper/datetime_json.dart';
import 'package:my_rss/domain/models/feed_item.dart';
import 'package:rss_dart/dart_rss.dart';
import 'package:uuid/uuid.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@freezed
abstract class Feed with _$Feed {
  const factory Feed({
    required String id,
    required String title,
    required String url,
    String? folderId,
    String? description,
    List<String>? categories,
    List<String>? tags,
    List<FeedItem>? items,
    @JsonKey(
      fromJson: DatetimeJson.dateTimeFromIso,
      toJson: DatetimeJson.dateTimeToIso,
    )
    DateTime? createdAt,
    @Default(true) bool autoFetch,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  factory Feed.fromRssFeed(RssFeed rssFeed) {
    final id = const Uuid().v4();
    return Feed(
      id: id,
      title: rssFeed.title ?? 'No title',
      url: rssFeed.link ?? '',
      description: rssFeed.description,
      categories: rssFeed.categories.isNotEmpty
          ? rssFeed.categories.map((e) => e.value ?? '').toList()
          : null,
      items: rssFeed.items
          .map(
            (rssItem) => FeedItem(
              id: rssItem.guid ?? rssItem.link ?? const Uuid().v4(),
              feedId: id,
              title: rssItem.title ?? 'No title',
              url: rssItem.link ?? '',
              description: rssItem.description,
              publishedAt: DateTime.tryParse(rssItem.pubDate ?? ''),
            ),
          )
          .toList(),
    );
  }
}
