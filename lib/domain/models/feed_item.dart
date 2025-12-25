import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_rss/core/helper/datetime_json.dart';

part 'feed_item.freezed.dart';
part 'feed_item.g.dart';

@freezed
abstract class FeedItem with _$FeedItem {
  const factory FeedItem({
    required String id,
    required String feedId,
    required String title,
    required String url,
    String? description,
    DateTime? publishedAt,
    @Default(false) bool isRead,
    @Default(false) bool isFavorite,
    @JsonKey(
      fromJson: DatetimeJson.dateTimeFromIso,
      toJson: DatetimeJson.dateTimeToIso,
    )
    DateTime? createdAt,
  }) = _FeedItem;

  factory FeedItem.fromJson(Map<String, dynamic> json) =>
      _$FeedItemFromJson(json);
}
