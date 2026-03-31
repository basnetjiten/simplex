/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'package:fpdart/fpdart.dart';
import '../errors/app_error.dart';
import '../errors/social_auth_exception.dart';

typedef EitherResponse<T> = Future<Either<AppError, T>>;
typedef EitherAuthResponse<T> = Future<Either<SocialAuthException, T>>;
typedef PagingFetchFn<K, T> =
    Future<(List<T> items, K? nextKey)> Function(K pageKey, String? search);
