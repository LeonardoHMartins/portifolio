import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:portfolio/core/common/errors/exceptions.dart';
import 'package:portfolio/core/common/errors/failures.dart';
import 'package:portfolio/core/common/services/connection/connection_service_impl.dart';

class TreaterService {
  Future<Either<Failure, T>> call<T>(
    Future<T> Function() code, {
    String? errorIdentification,
    bool online = false,
  }) async {
    if (await ConnectionServiceImpl().isConnected || !online) {
      try {
        return Right(await code());
      } on Failure catch (e) {
        log(e.toString(), stackTrace: e.stackTrace);
        return Left(e);
      } catch (e) {
        if (e is TypeError) {
          log(e.toString(), error: e, stackTrace: e.stackTrace, name: 'TypeError');
        } else {
          log(e.toString(), error: e);
        }
        if (e is DBException) {
          log('$errorIdentification: ${e.message}');
          return Left(
            DatabaseFailure(
              title: '$errorIdentification',
              description: e.message,
            ),
          );
        }
        if (e is DioException) {
          // if (await ConnectionServiceImpl().isConnected) {
          //   FirebaseCrashlytics.instance.recordError(e.message, e.stackTrace, fatal: false);
          // }
          return Left(
            ServerFailure(
              title: '$errorIdentification',
              description: e.response?.data['message'],
            ),
          );
        }
        if (e is ServerException) {
          // if (await ConnectionServiceImpl().isConnected) {
          //   FirebaseCrashlytics.instance.recordError(e.message, e.stackTrace, fatal: false);
          // }
          return Left(
            ServerFailure(
              title: '$errorIdentification',
              description: e.message,
            ),
          );
        }
        return Left(
          Failure(
            title: '$errorIdentification',
            description: e.toString(),
          ),
        );
      }
    } else {
      return const Left(Failure(title: 'Sem conexão com a internet'));
    }
  }
}
