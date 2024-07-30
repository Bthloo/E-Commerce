import 'package:b_commerce/features/login_screen/domain/entities/user_entitiy.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure_class.dart';
import '../../domain/repository/auth_repo.dart';
import '../datasource/auth_datasource.dart';

class AuthRepoImplmn extends AuthRepo {
  final AuthDatasource authDataSource;

  AuthRepoImplmn({required this.authDataSource});

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async {
    try {
      final user = await authDataSource.login(
        password: password,
        email: email,
      );
      return Right(user);
    } on DioException catch (e) {
      return Left(Failure(message: e.message ?? "Error"));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
  @override
  Future<Either<Failure, UserEntity>> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}