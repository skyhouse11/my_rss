import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_rss/core/helper/datetime_json.dart';
part 'folder.freezed.dart';
part 'folder.g.dart';

@freezed
abstract class Folder with _$Folder {
  const factory Folder({
    required String id,
    required String title,
    String? parentId,
    @JsonKey(
      fromJson: DatetimeJson.dateTimeFromIso,
      toJson: DatetimeJson.dateTimeToIso,
    )
    DateTime? createdAt,
  }) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
}
