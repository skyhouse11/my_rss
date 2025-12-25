// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Folder _$FolderFromJson(Map<String, dynamic> json) => _Folder(
  id: json['id'] as String,
  title: json['title'] as String,
  parentId: json['parentId'] as String?,
  createdAt: DatetimeJson.dateTimeFromIso(json['createdAt'] as String?),
);

Map<String, dynamic> _$FolderToJson(_Folder instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'parentId': instance.parentId,
  'createdAt': DatetimeJson.dateTimeToIso(instance.createdAt),
};
