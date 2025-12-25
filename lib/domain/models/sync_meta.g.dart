// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncMeta _$SyncMetaFromJson(Map<String, dynamic> json) => _SyncMeta(
  feedId: json['feedId'] as String?,
  lastSyncedAt: DatetimeJson.dateTimeFromIso(json['lastSyncedAt'] as String?),
  status:
      $enumDecodeNullable(_$SyncStatusEnumMap, json['status']) ??
      SyncStatus.idle,
  lastError: json['lastError'] as String?,
);

Map<String, dynamic> _$SyncMetaToJson(_SyncMeta instance) => <String, dynamic>{
  'feedId': instance.feedId,
  'lastSyncedAt': DatetimeJson.dateTimeToIso(instance.lastSyncedAt),
  'status': _$SyncStatusEnumMap[instance.status]!,
  'lastError': instance.lastError,
};

const _$SyncStatusEnumMap = {
  SyncStatus.idle: 'idle',
  SyncStatus.syncing: 'syncing',
  SyncStatus.failed: 'failed',
};
