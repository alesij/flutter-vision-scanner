import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

/// Represents a value of one of two possible types (a disjoint union).
@freezed
abstract class Either<L, R> with _$Either<L, R> {
  /// Contains a value of type L (usually a failure).
  const factory Either.left(L left) = Left<L, R>;

  /// Contains a value of type R (usually a success).
  const factory Either.right(R right) = Right<L, R>;
}
