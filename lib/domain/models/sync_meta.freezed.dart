// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncMeta {

 String? get feedId;@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) DateTime? get lastSyncedAt; SyncStatus get status; String? get lastError;
/// Create a copy of SyncMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncMetaCopyWith<SyncMeta> get copyWith => _$SyncMetaCopyWithImpl<SyncMeta>(this as SyncMeta, _$identity);

  /// Serializes this SyncMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncMeta&&(identical(other.feedId, feedId) || other.feedId == feedId)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastError, lastError) || other.lastError == lastError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,feedId,lastSyncedAt,status,lastError);

@override
String toString() {
  return 'SyncMeta(feedId: $feedId, lastSyncedAt: $lastSyncedAt, status: $status, lastError: $lastError)';
}


}

/// @nodoc
abstract mixin class $SyncMetaCopyWith<$Res>  {
  factory $SyncMetaCopyWith(SyncMeta value, $Res Function(SyncMeta) _then) = _$SyncMetaCopyWithImpl;
@useResult
$Res call({
 String? feedId,@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) DateTime? lastSyncedAt, SyncStatus status, String? lastError
});




}
/// @nodoc
class _$SyncMetaCopyWithImpl<$Res>
    implements $SyncMetaCopyWith<$Res> {
  _$SyncMetaCopyWithImpl(this._self, this._then);

  final SyncMeta _self;
  final $Res Function(SyncMeta) _then;

/// Create a copy of SyncMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? feedId = freezed,Object? lastSyncedAt = freezed,Object? status = null,Object? lastError = freezed,}) {
  return _then(_self.copyWith(
feedId: freezed == feedId ? _self.feedId : feedId // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SyncStatus,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncMeta].
extension SyncMetaPatterns on SyncMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncMeta value)  $default,){
final _that = this;
switch (_that) {
case _SyncMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncMeta value)?  $default,){
final _that = this;
switch (_that) {
case _SyncMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? feedId, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso)  DateTime? lastSyncedAt,  SyncStatus status,  String? lastError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncMeta() when $default != null:
return $default(_that.feedId,_that.lastSyncedAt,_that.status,_that.lastError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? feedId, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso)  DateTime? lastSyncedAt,  SyncStatus status,  String? lastError)  $default,) {final _that = this;
switch (_that) {
case _SyncMeta():
return $default(_that.feedId,_that.lastSyncedAt,_that.status,_that.lastError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? feedId, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso)  DateTime? lastSyncedAt,  SyncStatus status,  String? lastError)?  $default,) {final _that = this;
switch (_that) {
case _SyncMeta() when $default != null:
return $default(_that.feedId,_that.lastSyncedAt,_that.status,_that.lastError);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncMeta implements SyncMeta {
  const _SyncMeta({this.feedId, @JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) this.lastSyncedAt, this.status = SyncStatus.idle, this.lastError});
  factory _SyncMeta.fromJson(Map<String, dynamic> json) => _$SyncMetaFromJson(json);

@override final  String? feedId;
@override@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) final  DateTime? lastSyncedAt;
@override@JsonKey() final  SyncStatus status;
@override final  String? lastError;

/// Create a copy of SyncMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncMetaCopyWith<_SyncMeta> get copyWith => __$SyncMetaCopyWithImpl<_SyncMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncMeta&&(identical(other.feedId, feedId) || other.feedId == feedId)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastError, lastError) || other.lastError == lastError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,feedId,lastSyncedAt,status,lastError);

@override
String toString() {
  return 'SyncMeta(feedId: $feedId, lastSyncedAt: $lastSyncedAt, status: $status, lastError: $lastError)';
}


}

/// @nodoc
abstract mixin class _$SyncMetaCopyWith<$Res> implements $SyncMetaCopyWith<$Res> {
  factory _$SyncMetaCopyWith(_SyncMeta value, $Res Function(_SyncMeta) _then) = __$SyncMetaCopyWithImpl;
@override @useResult
$Res call({
 String? feedId,@JsonKey(fromJson: DatetimeJson.dateTimeFromIso, toJson: DatetimeJson.dateTimeToIso) DateTime? lastSyncedAt, SyncStatus status, String? lastError
});




}
/// @nodoc
class __$SyncMetaCopyWithImpl<$Res>
    implements _$SyncMetaCopyWith<$Res> {
  __$SyncMetaCopyWithImpl(this._self, this._then);

  final _SyncMeta _self;
  final $Res Function(_SyncMeta) _then;

/// Create a copy of SyncMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? feedId = freezed,Object? lastSyncedAt = freezed,Object? status = null,Object? lastError = freezed,}) {
  return _then(_SyncMeta(
feedId: freezed == feedId ? _self.feedId : feedId // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SyncStatus,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
