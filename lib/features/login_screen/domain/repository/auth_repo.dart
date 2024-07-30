import 'package:b_commerce/features/login_screen/domain/entities/user_entitiy.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure_class.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, UserEntity>> register(String email, String password);
}