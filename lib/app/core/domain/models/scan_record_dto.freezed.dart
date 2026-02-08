// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_record_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanRecordDto {

/// Unique identifier for the scan record (optional, auto-incremented).
 int? get id;/// File name of the scanned document.
 String get fileName;/// Scan type as a string (e.g., "face", "text").
 String get scanType;/// Saved timestamp in ISO 8601 format.
 String get savedAt;/// File size in bytes.
 int get fileSizeBytes;
/// Create a copy of ScanRecordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanRecordDtoCopyWith<ScanRecordDto> get copyWith => _$ScanRecordDtoCopyWithImpl<ScanRecordDto>(this as ScanRecordDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanRecordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.scanType, scanType) || other.scanType == scanType)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.fileSizeBytes, fileSizeBytes) || other.fileSizeBytes == fileSizeBytes));
}


@override
int get hashCode => Object.hash(runtimeType,id,fileName,scanType,savedAt,fileSizeBytes);

@override
String toString() {
  return 'ScanRecordDto(id: $id, fileName: $fileName, scanType: $scanType, savedAt: $savedAt, fileSizeBytes: $fileSizeBytes)';
}


}

/// @nodoc
abstract mixin class $ScanRecordDtoCopyWith<$Res>  {
  factory $ScanRecordDtoCopyWith(ScanRecordDto value, $Res Function(ScanRecordDto) _then) = _$ScanRecordDtoCopyWithImpl;
@useResult
$Res call({
 int? id, String fileName, String scanType, String savedAt, int fileSizeBytes
});




}
/// @nodoc
class _$ScanRecordDtoCopyWithImpl<$Res>
    implements $ScanRecordDtoCopyWith<$Res> {
  _$ScanRecordDtoCopyWithImpl(this._self, this._then);

  final ScanRecordDto _self;
  final $Res Function(ScanRecordDto) _then;

/// Create a copy of ScanRecordDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fileName = null,Object? scanType = null,Object? savedAt = null,Object? fileSizeBytes = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,scanType: null == scanType ? _self.scanType : scanType // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as String,fileSizeBytes: null == fileSizeBytes ? _self.fileSizeBytes : fileSizeBytes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanRecordDto].
extension ScanRecordDtoPatterns on ScanRecordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanRecordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanRecordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanRecordDto value)  $default,){
final _that = this;
switch (_that) {
case _ScanRecordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanRecordDto value)?  $default,){
final _that = this;
switch (_that) {
case _ScanRecordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String fileName,  String scanType,  String savedAt,  int fileSizeBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanRecordDto() when $default != null:
return $default(_that.id,_that.fileName,_that.scanType,_that.savedAt,_that.fileSizeBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String fileName,  String scanType,  String savedAt,  int fileSizeBytes)  $default,) {final _that = this;
switch (_that) {
case _ScanRecordDto():
return $default(_that.id,_that.fileName,_that.scanType,_that.savedAt,_that.fileSizeBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String fileName,  String scanType,  String savedAt,  int fileSizeBytes)?  $default,) {final _that = this;
switch (_that) {
case _ScanRecordDto() when $default != null:
return $default(_that.id,_that.fileName,_that.scanType,_that.savedAt,_that.fileSizeBytes);case _:
  return null;

}
}

}

/// @nodoc


class _ScanRecordDto extends ScanRecordDto {
  const _ScanRecordDto({this.id, required this.fileName, required this.scanType, required this.savedAt, required this.fileSizeBytes}): super._();
  

/// Unique identifier for the scan record (optional, auto-incremented).
@override final  int? id;
/// File name of the scanned document.
@override final  String fileName;
/// Scan type as a string (e.g., "face", "text").
@override final  String scanType;
/// Saved timestamp in ISO 8601 format.
@override final  String savedAt;
/// File size in bytes.
@override final  int fileSizeBytes;

/// Create a copy of ScanRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanRecordDtoCopyWith<_ScanRecordDto> get copyWith => __$ScanRecordDtoCopyWithImpl<_ScanRecordDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanRecordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.scanType, scanType) || other.scanType == scanType)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.fileSizeBytes, fileSizeBytes) || other.fileSizeBytes == fileSizeBytes));
}


@override
int get hashCode => Object.hash(runtimeType,id,fileName,scanType,savedAt,fileSizeBytes);

@override
String toString() {
  return 'ScanRecordDto(id: $id, fileName: $fileName, scanType: $scanType, savedAt: $savedAt, fileSizeBytes: $fileSizeBytes)';
}


}

/// @nodoc
abstract mixin class _$ScanRecordDtoCopyWith<$Res> implements $ScanRecordDtoCopyWith<$Res> {
  factory _$ScanRecordDtoCopyWith(_ScanRecordDto value, $Res Function(_ScanRecordDto) _then) = __$ScanRecordDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String fileName, String scanType, String savedAt, int fileSizeBytes
});




}
/// @nodoc
class __$ScanRecordDtoCopyWithImpl<$Res>
    implements _$ScanRecordDtoCopyWith<$Res> {
  __$ScanRecordDtoCopyWithImpl(this._self, this._then);

  final _ScanRecordDto _self;
  final $Res Function(_ScanRecordDto) _then;

/// Create a copy of ScanRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fileName = null,Object? scanType = null,Object? savedAt = null,Object? fileSizeBytes = null,}) {
  return _then(_ScanRecordDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,scanType: null == scanType ? _self.scanType : scanType // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as String,fileSizeBytes: null == fileSizeBytes ? _self.fileSizeBytes : fileSizeBytes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
