// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProcessingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProcessingState()';
}


}

/// @nodoc
class $ProcessingStateCopyWith<$Res>  {
$ProcessingStateCopyWith(ProcessingState _, $Res Function(ProcessingState) __);
}


/// Adds pattern-matching-related methods to [ProcessingState].
extension ProcessingStatePatterns on ProcessingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Processing value)?  processing,TResult Function( _Successful value)?  successful,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Processing() when processing != null:
return processing(_that);case _Successful() when successful != null:
return successful(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Processing value)  processing,required TResult Function( _Successful value)  successful,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Processing():
return processing(_that);case _Successful():
return successful(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Processing value)?  processing,TResult? Function( _Successful value)?  successful,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Processing() when processing != null:
return processing(_that);case _Successful() when successful != null:
return successful(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  processing,TResult Function( List<Face>? facesDetected,  RecognizedText? recognizedText)?  successful,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Processing() when processing != null:
return processing(_that.message);case _Successful() when successful != null:
return successful(_that.facesDetected,_that.recognizedText);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  processing,required TResult Function( List<Face>? facesDetected,  RecognizedText? recognizedText)  successful,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Processing():
return processing(_that.message);case _Successful():
return successful(_that.facesDetected,_that.recognizedText);case _Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  processing,TResult? Function( List<Face>? facesDetected,  RecognizedText? recognizedText)?  successful,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Processing() when processing != null:
return processing(_that.message);case _Successful() when successful != null:
return successful(_that.facesDetected,_that.recognizedText);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Processing implements ProcessingState {
  const _Processing({required this.message});
  

 final  String message;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessingCopyWith<_Processing> get copyWith => __$ProcessingCopyWithImpl<_Processing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Processing&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProcessingState.processing(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ProcessingCopyWith<$Res> implements $ProcessingStateCopyWith<$Res> {
  factory _$ProcessingCopyWith(_Processing value, $Res Function(_Processing) _then) = __$ProcessingCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ProcessingCopyWithImpl<$Res>
    implements _$ProcessingCopyWith<$Res> {
  __$ProcessingCopyWithImpl(this._self, this._then);

  final _Processing _self;
  final $Res Function(_Processing) _then;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Processing(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Successful implements ProcessingState {
  const _Successful({final  List<Face>? facesDetected, this.recognizedText}): _facesDetected = facesDetected;
  

 final  List<Face>? _facesDetected;
 List<Face>? get facesDetected {
  final value = _facesDetected;
  if (value == null) return null;
  if (_facesDetected is EqualUnmodifiableListView) return _facesDetected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  RecognizedText? recognizedText;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessfulCopyWith<_Successful> get copyWith => __$SuccessfulCopyWithImpl<_Successful>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Successful&&const DeepCollectionEquality().equals(other._facesDetected, _facesDetected)&&(identical(other.recognizedText, recognizedText) || other.recognizedText == recognizedText));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_facesDetected),recognizedText);

@override
String toString() {
  return 'ProcessingState.successful(facesDetected: $facesDetected, recognizedText: $recognizedText)';
}


}

/// @nodoc
abstract mixin class _$SuccessfulCopyWith<$Res> implements $ProcessingStateCopyWith<$Res> {
  factory _$SuccessfulCopyWith(_Successful value, $Res Function(_Successful) _then) = __$SuccessfulCopyWithImpl;
@useResult
$Res call({
 List<Face>? facesDetected, RecognizedText? recognizedText
});




}
/// @nodoc
class __$SuccessfulCopyWithImpl<$Res>
    implements _$SuccessfulCopyWith<$Res> {
  __$SuccessfulCopyWithImpl(this._self, this._then);

  final _Successful _self;
  final $Res Function(_Successful) _then;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? facesDetected = freezed,Object? recognizedText = freezed,}) {
  return _then(_Successful(
facesDetected: freezed == facesDetected ? _self._facesDetected : facesDetected // ignore: cast_nullable_to_non_nullable
as List<Face>?,recognizedText: freezed == recognizedText ? _self.recognizedText : recognizedText // ignore: cast_nullable_to_non_nullable
as RecognizedText?,
  ));
}


}

/// @nodoc


class _Error implements ProcessingState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProcessingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProcessingStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
