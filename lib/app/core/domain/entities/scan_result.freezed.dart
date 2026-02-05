// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanResult()';
}


}

/// @nodoc
class $ScanResultCopyWith<$Res>  {
$ScanResultCopyWith(ScanResult _, $Res Function(ScanResult) __);
}


/// Adds pattern-matching-related methods to [ScanResult].
extension ScanResultPatterns on ScanResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FacesResult value)?  faces,TResult Function( TextResult value)?  text,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FacesResult() when faces != null:
return faces(_that);case TextResult() when text != null:
return text(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FacesResult value)  faces,required TResult Function( TextResult value)  text,}){
final _that = this;
switch (_that) {
case FacesResult():
return faces(_that);case TextResult():
return text(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FacesResult value)?  faces,TResult? Function( TextResult value)?  text,}){
final _that = this;
switch (_that) {
case FacesResult() when faces != null:
return faces(_that);case TextResult() when text != null:
return text(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String originalImagePath,  String filteredImagePath)?  faces,TResult Function( String rawText,  String? outputPdfPath)?  text,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FacesResult() when faces != null:
return faces(_that.originalImagePath,_that.filteredImagePath);case TextResult() when text != null:
return text(_that.rawText,_that.outputPdfPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String originalImagePath,  String filteredImagePath)  faces,required TResult Function( String rawText,  String? outputPdfPath)  text,}) {final _that = this;
switch (_that) {
case FacesResult():
return faces(_that.originalImagePath,_that.filteredImagePath);case TextResult():
return text(_that.rawText,_that.outputPdfPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String originalImagePath,  String filteredImagePath)?  faces,TResult? Function( String rawText,  String? outputPdfPath)?  text,}) {final _that = this;
switch (_that) {
case FacesResult() when faces != null:
return faces(_that.originalImagePath,_that.filteredImagePath);case TextResult() when text != null:
return text(_that.rawText,_that.outputPdfPath);case _:
  return null;

}
}

}

/// @nodoc


class FacesResult implements ScanResult {
  const FacesResult({required this.originalImagePath, required this.filteredImagePath});
  

 final  String originalImagePath;
 final  String filteredImagePath;

/// Create a copy of ScanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacesResultCopyWith<FacesResult> get copyWith => _$FacesResultCopyWithImpl<FacesResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacesResult&&(identical(other.originalImagePath, originalImagePath) || other.originalImagePath == originalImagePath)&&(identical(other.filteredImagePath, filteredImagePath) || other.filteredImagePath == filteredImagePath));
}


@override
int get hashCode => Object.hash(runtimeType,originalImagePath,filteredImagePath);

@override
String toString() {
  return 'ScanResult.faces(originalImagePath: $originalImagePath, filteredImagePath: $filteredImagePath)';
}


}

/// @nodoc
abstract mixin class $FacesResultCopyWith<$Res> implements $ScanResultCopyWith<$Res> {
  factory $FacesResultCopyWith(FacesResult value, $Res Function(FacesResult) _then) = _$FacesResultCopyWithImpl;
@useResult
$Res call({
 String originalImagePath, String filteredImagePath
});




}
/// @nodoc
class _$FacesResultCopyWithImpl<$Res>
    implements $FacesResultCopyWith<$Res> {
  _$FacesResultCopyWithImpl(this._self, this._then);

  final FacesResult _self;
  final $Res Function(FacesResult) _then;

/// Create a copy of ScanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? originalImagePath = null,Object? filteredImagePath = null,}) {
  return _then(FacesResult(
originalImagePath: null == originalImagePath ? _self.originalImagePath : originalImagePath // ignore: cast_nullable_to_non_nullable
as String,filteredImagePath: null == filteredImagePath ? _self.filteredImagePath : filteredImagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TextResult implements ScanResult {
  const TextResult({required this.rawText, this.outputPdfPath});
  

 final  String rawText;
 final  String? outputPdfPath;

/// Create a copy of ScanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextResultCopyWith<TextResult> get copyWith => _$TextResultCopyWithImpl<TextResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextResult&&(identical(other.rawText, rawText) || other.rawText == rawText)&&(identical(other.outputPdfPath, outputPdfPath) || other.outputPdfPath == outputPdfPath));
}


@override
int get hashCode => Object.hash(runtimeType,rawText,outputPdfPath);

@override
String toString() {
  return 'ScanResult.text(rawText: $rawText, outputPdfPath: $outputPdfPath)';
}


}

/// @nodoc
abstract mixin class $TextResultCopyWith<$Res> implements $ScanResultCopyWith<$Res> {
  factory $TextResultCopyWith(TextResult value, $Res Function(TextResult) _then) = _$TextResultCopyWithImpl;
@useResult
$Res call({
 String rawText, String? outputPdfPath
});




}
/// @nodoc
class _$TextResultCopyWithImpl<$Res>
    implements $TextResultCopyWith<$Res> {
  _$TextResultCopyWithImpl(this._self, this._then);

  final TextResult _self;
  final $Res Function(TextResult) _then;

/// Create a copy of ScanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rawText = null,Object? outputPdfPath = freezed,}) {
  return _then(TextResult(
rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,outputPdfPath: freezed == outputPdfPath ? _self.outputPdfPath : outputPdfPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
