import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_rss/core/helper/datetime_json.dart';
part 'sync_meta.freezed.dart';
part 'sync_meta.g.dart';

enum SyncStatus { idle, syncing, failed }

@freezed
abstract class SyncMeta with _$SyncMeta {
  const factory SyncMeta({
    String? feedId,
    @JsonKey(
      fromJson: DatetimeJson.dateTimeFromIso,
      toJson: DatetimeJson.dateTimeToIso,
    )
    DateTime? lastSyncedAt,
    @Default(SyncStatus.idle) SyncStatus status,
    String? lastError,
  }) = _SyncMeta;

  factory SyncMeta.fromJson(Map<String, dynamic> json) =>
      _$SyncMetaFromJson(json);
}
