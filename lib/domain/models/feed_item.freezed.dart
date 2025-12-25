// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedItem {

 String get id; String get feedId; String get title; String get url; String? get description; DateTime? get publishedAt; bool get isRead; bool get isFavorite;@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) DateTime? get createdAt;
/// Create a copy of FeedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedItemCopyWith<FeedItem> get copyWith => _$FeedItemCopyWithImpl<FeedItem>(this as FeedItem, _$identity);

  /// Serializes this FeedItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.feedId, feedId) || other.feedId == feedId)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.description, description) || other.description == description)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,feedId,title,url,description,publishedAt,isRead,isFavorite,createdAt);

@override
String toString() {
  return 'FeedItem(id: $id, feedId: $feedId, title: $title, url: $url, description: $description, publishedAt: $publishedAt, isRead: $isRead, isFavorite: $isFavorite, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FeedItemCopyWith<$Res>  {
  factory $FeedItemCopyWith(FeedItem value, $Res Function(FeedItem) _then) = _$FeedItemCopyWithImpl;
@useResult
$Res call({
 String id, String feedId, String title, String url, String? description, DateTime? publishedAt, bool isRead, bool isFavorite,@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) DateTime? createdAt
});




}
/// @nodoc
class _$FeedItemCopyWithImpl<$Res>
    implements $FeedItemCopyWith<$Res> {
  _$FeedItemCopyWithImpl(this._self, this._then);

  final FeedItem _self;
  final $Res Function(FeedItem) _then;

/// Create a copy of FeedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? feedId = null,Object? title = null,Object? url = null,Object? description = freezed,Object? publishedAt = freezed,Object? isRead = null,Object? isFavorite = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,feedId: null == feedId ? _self.feedId : feedId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedItem].
extension FeedItemPatterns on FeedItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedItem value)  $default,){
final _that = this;
switch (_that) {
case _FeedItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedItem value)?  $default,){
final _that = this;
switch (_that) {
case _FeedItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String feedId,  String title,  String url,  String? description,  DateTime? publishedAt,  bool isRead,  bool isFavorite, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso)  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedItem() when $default != null:
return $default(_that.id,_that.feedId,_that.title,_that.url,_that.description,_that.publishedAt,_that.isRead,_that.isFavorite,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String feedId,  String title,  String url,  String? description,  DateTime? publishedAt,  bool isRead,  bool isFavorite, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso)  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FeedItem():
return $default(_that.id,_that.feedId,_that.title,_that.url,_that.description,_that.publishedAt,_that.isRead,_that.isFavorite,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String feedId,  String title,  String url,  String? description,  DateTime? publishedAt,  bool isRead,  bool isFavorite, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso)  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FeedItem() when $default != null:
return $default(_that.id,_that.feedId,_that.title,_that.url,_that.description,_that.publishedAt,_that.isRead,_that.isFavorite,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedItem implements FeedItem {
  const _FeedItem({required this.id, required this.feedId, required this.title, required this.url, this.description, this.publishedAt, this.isRead = false, this.isFavorite = false, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) this.createdAt});
  factory _FeedItem.fromJson(Map<String, dynamic> json) => _$FeedItemFromJson(json);

@override final  String id;
@override final  String feedId;
@override final  String title;
@override final  String url;
@override final  String? description;
@override final  DateTime? publishedAt;
@override@JsonKey() final  bool isRead;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) final  DateTime? createdAt;

/// Create a copy of FeedItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedItemCopyWith<_FeedItem> get copyWith => __$FeedItemCopyWithImpl<_FeedItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.feedId, feedId) || other.feedId == feedId)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.description, description) || other.description == description)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,feedId,title,url,description,publishedAt,isRead,isFavorite,createdAt);

@override
String toString() {
  return 'FeedItem(id: $id, feedId: $feedId, title: $title, url: $url, description: $description, publishedAt: $publishedAt, isRead: $isRead, isFavorite: $isFavorite, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FeedItemCopyWith<$Res> implements $FeedItemCopyWith<$Res> {
  factory _$FeedItemCopyWith(_FeedItem value, $Res Function(_FeedItem) _then) = __$FeedItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String feedId, String title, String url, String? description, DateTime? publishedAt, bool isRead, bool isFavorite,@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) DateTime? createdAt
});




}
/// @nodoc
class __$FeedItemCopyWithImpl<$Res>
    implements _$FeedItemCopyWith<$Res> {
  __$FeedItemCopyWithImpl(this._self, this._then);

  final _FeedItem _self;
  final $Res Function(_FeedItem) _then;

/// Create a copy of FeedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? feedId = null,Object? title = null,Object? url = null,Object? description = freezed,Object? publishedAt = freezed,Object? isRead = null,Object? isFavorite = null,Object? createdAt = freezed,}) {
  return _then(_FeedItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,feedId: null == feedId ? _self.feedId : feedId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
