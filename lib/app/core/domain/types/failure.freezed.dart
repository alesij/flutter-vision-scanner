// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

/// Error message describing the failure.
 String get message;/// Optional body with additional error details.
 String? get body;/// Optional error code.
 String? get code;/// Optional stack trace for debugging.
 StackTrace? get strackTrace;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message)&&(identical(other.body, body) || other.body == body)&&(identical(other.code, code) || other.code == code)&&(identical(other.strackTrace, strackTrace) || other.strackTrace == strackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,body,code,strackTrace);

@override
String toString() {
  return 'Failure(message: $message, body: $body, code: $code, strackTrace: $strackTrace)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message, String? body, String? code, StackTrace? strackTrace
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? body = freezed,Object? code = freezed,Object? strackTrace = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,strackTrace: freezed == strackTrace ? _self.strackTrace : strackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GenericFailure value)?  generic,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenericFailure() when generic != null:
return generic(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GenericFailure value)  generic,}){
final _that = this;
switch (_that) {
case _GenericFailure():
return generic(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GenericFailure value)?  generic,}){
final _that = this;
switch (_that) {
case _GenericFailure() when generic != null:
return generic(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  String? body,  String? code,  StackTrace? strackTrace)?  generic,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenericFailure() when generic != null:
return generic(_that.message,_that.body,_that.code,_that.strackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  String? body,  String? code,  StackTrace? strackTrace)  generic,}) {final _that = this;
switch (_that) {
case _GenericFailure():
return generic(_that.message,_that.body,_that.code,_that.strackTrace);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  String? body,  String? code,  StackTrace? strackTrace)?  generic,}) {final _that = this;
switch (_that) {
case _GenericFailure() when generic != null:
return generic(_that.message,_that.body,_that.code,_that.strackTrace);case _:
  return null;

}
}

}

/// @nodoc


class _GenericFailure extends Failure {
  const _GenericFailure({this.message = 'An unexpected error occurred', this.body, this.code, this.strackTrace}): super._();
  

/// Error message describing the failure.
@override@JsonKey() final  String message;
/// Optional body with additional error details.
@override final  String? body;
/// Optional error code.
@override final  String? code;
/// Optional stack trace for debugging.
@override final  StackTrace? strackTrace;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenericFailureCopyWith<_GenericFailure> get copyWith => __$GenericFailureCopyWithImpl<_GenericFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenericFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.body, body) || other.body == body)&&(identical(other.code, code) || other.code == code)&&(identical(other.strackTrace, strackTrace) || other.strackTrace == strackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,body,code,strackTrace);

@override
String toString() {
  return 'Failure.generic(message: $message, body: $body, code: $code, strackTrace: $strackTrace)';
}


}

/// @nodoc
abstract mixin class _$GenericFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$GenericFailureCopyWith(_GenericFailure value, $Res Function(_GenericFailure) _then) = __$GenericFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, String? body, String? code, StackTrace? strackTrace
});




}
/// @nodoc
class __$GenericFailureCopyWithImpl<$Res>
    implements _$GenericFailureCopyWith<$Res> {
  __$GenericFailureCopyWithImpl(this._self, this._then);

  final _GenericFailure _self;
  final $Res Function(_GenericFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? body = freezed,Object? code = freezed,Object? strackTrace = freezed,}) {
  return _then(_GenericFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,strackTrace: freezed == strackTrace ? _self.strackTrace : strackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
