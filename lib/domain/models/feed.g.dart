// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Feed _$FeedFromJson(Map<String, dynamic> json) => _Feed(
  id: json['id'] as String,
  title: json['title'] as String,
  url: json['url'] as String,
  folderId: json['folderId'] as String?,
  description: json['description'] as String?,
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  createdAt: DatetimeJson.dateTimeFromIso(json['createdAt'] as String?),
  lastUpdatedAt: DatetimeJson.dateTimeFromIso(json['lastUpdatedAt'] as String?),
  autoFetch: json['autoFetch'] as bool? ?? true,
);

Map<String, dynamic> _$FeedToJson(_Feed instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'url': instance.url,
  'folderId': instance.folderId,
  'description': instance.description,
  'categories': instance.categories,
  'tags': instance.tags,
  'createdAt': DatetimeJson.dateTimeToIso(instance.createdAt),
  'lastUpdatedAt': DatetimeJson.dateTimeToIso(instance.lastUpdatedAt),
  'autoFetch': instance.autoFetch,
};
