import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/failure.dart';

/// Maps a DTO to a domain entity, handling errors with Either.
Future<Either<Failure, U>> mapDtoFuture<T, U>({
  /// Future that returns Either a Failure or a DTO.
  required final Future<Either<Failure, T>> dto,

  /// Function to map the DTO to the domain entity.
  required final U Function(T) data,
}) async => (await dto).when(
  left: (failure) => Left(failure),
  right: (content) => Right(data(content)),
);
