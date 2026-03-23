import 'package:fpdart/fpdart.dart';
import 'package:simplex/errors/app_error.dart';
import 'package:simplex/errors/social_auth_exception.dart';

typedef EitherResponse<T> = Future<Either<AppError, T>>;
typedef EitherAuthResponse<T> = Future<Either<SocialAuthException, T>>;
typedef PagingFetchFn<K, T> =
    Future<(List<T> items, K? nextKey)> Function(K pageKey, String? search);
