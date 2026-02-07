// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanResultState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanResultState()';
}


}

/// @nodoc
class $ScanResultStateCopyWith<$Res>  {
$ScanResultStateCopyWith(ScanResultState _, $Res Function(ScanResultState) __);
}


/// Adds pattern-matching-related methods to [ScanResultState].
extension ScanResultStatePatterns on ScanResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ScanResultStateInitial value)?  initial,TResult Function( _ScanResultStateReady value)?  ready,TResult Function( _ScanResultStateSaving value)?  saving,TResult Function( _ScanResultStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanResultStateInitial() when initial != null:
return initial(_that);case _ScanResultStateReady() when ready != null:
return ready(_that);case _ScanResultStateSaving() when saving != null:
return saving(_that);case _ScanResultStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ScanResultStateInitial value)  initial,required TResult Function( _ScanResultStateReady value)  ready,required TResult Function( _ScanResultStateSaving value)  saving,required TResult Function( _ScanResultStateError value)  error,}){
final _that = this;
switch (_that) {
case _ScanResultStateInitial():
return initial(_that);case _ScanResultStateReady():
return ready(_that);case _ScanResultStateSaving():
return saving(_that);case _ScanResultStateError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ScanResultStateInitial value)?  initial,TResult? Function( _ScanResultStateReady value)?  ready,TResult? Function( _ScanResultStateSaving value)?  saving,TResult? Function( _ScanResultStateError value)?  error,}){
final _that = this;
switch (_that) {
case _ScanResultStateInitial() when initial != null:
return initial(_that);case _ScanResultStateReady() when ready != null:
return ready(_that);case _ScanResultStateSaving() when saving != null:
return saving(_that);case _ScanResultStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( ScanResult scanResult)?  ready,TResult Function()?  saving,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanResultStateInitial() when initial != null:
return initial();case _ScanResultStateReady() when ready != null:
return ready(_that.scanResult);case _ScanResultStateSaving() when saving != null:
return saving();case _ScanResultStateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( ScanResult scanResult)  ready,required TResult Function()  saving,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _ScanResultStateInitial():
return initial();case _ScanResultStateReady():
return ready(_that.scanResult);case _ScanResultStateSaving():
return saving();case _ScanResultStateError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( ScanResult scanResult)?  ready,TResult? Function()?  saving,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _ScanResultStateInitial() when initial != null:
return initial();case _ScanResultStateReady() when ready != null:
return ready(_that.scanResult);case _ScanResultStateSaving() when saving != null:
return saving();case _ScanResultStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ScanResultStateInitial implements ScanResultState {
  const _ScanResultStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanResultStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanResultState.initial()';
}


}




/// @nodoc


class _ScanResultStateReady implements ScanResultState {
  const _ScanResultStateReady({required this.scanResult});
  

 final  ScanResult scanResult;

/// Create a copy of ScanResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanResultStateReadyCopyWith<_ScanResultStateReady> get copyWith => __$ScanResultStateReadyCopyWithImpl<_ScanResultStateReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanResultStateReady&&(identical(other.scanResult, scanResult) || other.scanResult == scanResult));
}


@override
int get hashCode => Object.hash(runtimeType,scanResult);

@override
String toString() {
  return 'ScanResultState.ready(scanResult: $scanResult)';
}


}

/// @nodoc
abstract mixin class _$ScanResultStateReadyCopyWith<$Res> implements $ScanResultStateCopyWith<$Res> {
  factory _$ScanResultStateReadyCopyWith(_ScanResultStateReady value, $Res Function(_ScanResultStateReady) _then) = __$ScanResultStateReadyCopyWithImpl;
@useResult
$Res call({
 ScanResult scanResult
});


$ScanResultCopyWith<$Res> get scanResult;

}
/// @nodoc
class __$ScanResultStateReadyCopyWithImpl<$Res>
    implements _$ScanResultStateReadyCopyWith<$Res> {
  __$ScanResultStateReadyCopyWithImpl(this._self, this._then);

  final _ScanResultStateReady _self;
  final $Res Function(_ScanResultStateReady) _then;

/// Create a copy of ScanResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scanResult = null,}) {
  return _then(_ScanResultStateReady(
scanResult: null == scanResult ? _self.scanResult : scanResult // ignore: cast_nullable_to_non_nullable
as ScanResult,
  ));
}

/// Create a copy of ScanResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScanResultCopyWith<$Res> get scanResult {
  
  return $ScanResultCopyWith<$Res>(_self.scanResult, (value) {
    return _then(_self.copyWith(scanResult: value));
  });
}
}

/// @nodoc


class _ScanResultStateSaving implements ScanResultState {
  const _ScanResultStateSaving();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanResultStateSaving);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanResultState.saving()';
}


}




/// @nodoc


class _ScanResultStateError implements ScanResultState {
  const _ScanResultStateError({required this.message});
  

 final  String message;

/// Create a copy of ScanResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanResultStateErrorCopyWith<_ScanResultStateError> get copyWith => __$ScanResultStateErrorCopyWithImpl<_ScanResultStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanResultStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ScanResultState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ScanResultStateErrorCopyWith<$Res> implements $ScanResultStateCopyWith<$Res> {
  factory _$ScanResultStateErrorCopyWith(_ScanResultStateError value, $Res Function(_ScanResultStateError) _then) = __$ScanResultStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ScanResultStateErrorCopyWithImpl<$Res>
    implements _$ScanResultStateErrorCopyWith<$Res> {
  __$ScanResultStateErrorCopyWithImpl(this._self, this._then);

  final _ScanResultStateError _self;
  final $Res Function(_ScanResultStateError) _then;

/// Create a copy of ScanResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ScanResultStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
