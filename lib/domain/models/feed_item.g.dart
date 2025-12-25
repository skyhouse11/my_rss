// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedItem _$FeedItemFromJson(Map<String, dynamic> json) => _FeedItem(
  id: json['id'] as String,
  feedId: json['feedId'] as String,
  title: json['title'] as String,
  url: json['url'] as String,
  description: json['description'] as String?,
  publishedAt: json['publishedAt'] == null
      ? null
      : DateTime.parse(json['publishedAt'] as String),
  isRead: json['isRead'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
  createdAt: DatetimeJson.dateTimeFromIso(json['createdAt'] as String?),
);

Map<String, dynamic> _$FeedItemToJson(_FeedItem instance) => <String, dynamic>{
  'id': instance.id,
  'feedId': instance.feedId,
  'title': instance.title,
  'url': instance.url,
  'description': instance.description,
  'publishedAt': instance.publishedAt?.toIso8601String(),
  'isRead': instance.isRead,
  'isFavorite': instance.isFavorite,
  'createdAt': DatetimeJson.dateTimeToIso(instance.createdAt),
};
