import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failure.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, void>> signIn(String email, String password);
  Future<Either<Failure, void>> signUp(String email, String password,String username,String phone);
}
