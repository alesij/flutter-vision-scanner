// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomePageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomePageState()';
}


}

/// @nodoc
class $HomePageStateCopyWith<$Res>  {
$HomePageStateCopyWith(HomePageState _, $Res Function(HomePageState) __);
}


/// Adds pattern-matching-related methods to [HomePageState].
extension HomePageStatePatterns on HomePageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NoScans value)?  noScans,TResult Function( _Loading value)?  loading,TResult Function( _Data value)?  data,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoScans() when noScans != null:
return noScans(_that);case _Loading() when loading != null:
return loading(_that);case _Data() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NoScans value)  noScans,required TResult Function( _Loading value)  loading,required TResult Function( _Data value)  data,}){
final _that = this;
switch (_that) {
case _NoScans():
return noScans(_that);case _Loading():
return loading(_that);case _Data():
return data(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NoScans value)?  noScans,TResult? Function( _Loading value)?  loading,TResult? Function( _Data value)?  data,}){
final _that = this;
switch (_that) {
case _NoScans() when noScans != null:
return noScans(_that);case _Loading() when loading != null:
return loading(_that);case _Data() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  noScans,TResult Function()?  loading,TResult Function( List<ScanRecord> items)?  data,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoScans() when noScans != null:
return noScans();case _Loading() when loading != null:
return loading();case _Data() when data != null:
return data(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  noScans,required TResult Function()  loading,required TResult Function( List<ScanRecord> items)  data,}) {final _that = this;
switch (_that) {
case _NoScans():
return noScans();case _Loading():
return loading();case _Data():
return data(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  noScans,TResult? Function()?  loading,TResult? Function( List<ScanRecord> items)?  data,}) {final _that = this;
switch (_that) {
case _NoScans() when noScans != null:
return noScans();case _Loading() when loading != null:
return loading();case _Data() when data != null:
return data(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _NoScans implements HomePageState {
  const _NoScans();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoScans);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomePageState.noScans()';
}


}




/// @nodoc


class _Loading implements HomePageState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomePageState.loading()';
}


}




/// @nodoc


class _Data implements HomePageState {
  const _Data({required final  List<ScanRecord> items}): _items = items;
  

 final  List<ScanRecord> _items;
 List<ScanRecord> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'HomePageState.data(items: $items)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $HomePageStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@useResult
$Res call({
 List<ScanRecord> items
});




}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_Data(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ScanRecord>,
  ));
}


}

// dart format on
