// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Feed {

 String get id; String get title; String get url; String? get folderId; String? get description; List<String>? get categories; List<String>? get tags; List<FeedItem>? get items;@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) DateTime? get createdAt; bool get autoFetch;
/// Create a copy of Feed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedCopyWith<Feed> get copyWith => _$FeedCopyWithImpl<Feed>(this as Feed, _$identity);

  /// Serializes this Feed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Feed&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.autoFetch, autoFetch) || other.autoFetch == autoFetch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,url,folderId,description,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(items),createdAt,autoFetch);

@override
String toString() {
  return 'Feed(id: $id, title: $title, url: $url, folderId: $folderId, description: $description, categories: $categories, tags: $tags, items: $items, createdAt: $createdAt, autoFetch: $autoFetch)';
}


}

/// @nodoc
abstract mixin class $FeedCopyWith<$Res>  {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) _then) = _$FeedCopyWithImpl;
@useResult
$Res call({
 String id, String title, String url, String? folderId, String? description, List<String>? categories, List<String>? tags, List<FeedItem>? items,@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) DateTime? createdAt, bool autoFetch
});




}
/// @nodoc
class _$FeedCopyWithImpl<$Res>
    implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._self, this._then);

  final Feed _self;
  final $Res Function(Feed) _then;

/// Create a copy of Feed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? url = null,Object? folderId = freezed,Object? description = freezed,Object? categories = freezed,Object? tags = freezed,Object? items = freezed,Object? createdAt = freezed,Object? autoFetch = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<FeedItem>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,autoFetch: null == autoFetch ? _self.autoFetch : autoFetch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Feed].
extension FeedPatterns on Feed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Feed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Feed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Feed value)  $default,){
final _that = this;
switch (_that) {
case _Feed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Feed value)?  $default,){
final _that = this;
switch (_that) {
case _Feed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String url,  String? folderId,  String? description,  List<String>? categories,  List<String>? tags,  List<FeedItem>? items, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso)  DateTime? createdAt,  bool autoFetch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Feed() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.folderId,_that.description,_that.categories,_that.tags,_that.items,_that.createdAt,_that.autoFetch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String url,  String? folderId,  String? description,  List<String>? categories,  List<String>? tags,  List<FeedItem>? items, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso)  DateTime? createdAt,  bool autoFetch)  $default,) {final _that = this;
switch (_that) {
case _Feed():
return $default(_that.id,_that.title,_that.url,_that.folderId,_that.description,_that.categories,_that.tags,_that.items,_that.createdAt,_that.autoFetch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String url,  String? folderId,  String? description,  List<String>? categories,  List<String>? tags,  List<FeedItem>? items, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso)  DateTime? createdAt,  bool autoFetch)?  $default,) {final _that = this;
switch (_that) {
case _Feed() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.folderId,_that.description,_that.categories,_that.tags,_that.items,_that.createdAt,_that.autoFetch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Feed implements Feed {
  const _Feed({required this.id, required this.title, required this.url, this.folderId, this.description, final  List<String>? categories, final  List<String>? tags, final  List<FeedItem>? items, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) this.createdAt, this.autoFetch = true}): _categories = categories,_tags = tags,_items = items;
  factory _Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

@override final  String id;
@override final  String title;
@override final  String url;
@override final  String? folderId;
@override final  String? description;
 final  List<String>? _categories;
@override List<String>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<FeedItem>? _items;
@override List<FeedItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) final  DateTime? createdAt;
@override@JsonKey() final  bool autoFetch;

/// Create a copy of Feed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedCopyWith<_Feed> get copyWith => __$FeedCopyWithImpl<_Feed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Feed&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.autoFetch, autoFetch) || other.autoFetch == autoFetch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,url,folderId,description,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_items),createdAt,autoFetch);

@override
String toString() {
  return 'Feed(id: $id, title: $title, url: $url, folderId: $folderId, description: $description, categories: $categories, tags: $tags, items: $items, createdAt: $createdAt, autoFetch: $autoFetch)';
}


}

/// @nodoc
abstract mixin class _$FeedCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$FeedCopyWith(_Feed value, $Res Function(_Feed) _then) = __$FeedCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String url, String? folderId, String? description, List<String>? categories, List<String>? tags, List<FeedItem>? items,@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) DateTime? createdAt, bool autoFetch
});




}
/// @nodoc
class __$FeedCopyWithImpl<$Res>
    implements _$FeedCopyWith<$Res> {
  __$FeedCopyWithImpl(this._self, this._then);

  final _Feed _self;
  final $Res Function(_Feed) _then;

/// Create a copy of Feed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? url = null,Object? folderId = freezed,Object? description = freezed,Object? categories = freezed,Object? tags = freezed,Object? items = freezed,Object? createdAt = freezed,Object? autoFetch = null,}) {
  return _then(_Feed(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<FeedItem>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,autoFetch: null == autoFetch ? _self.autoFetch : autoFetch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
