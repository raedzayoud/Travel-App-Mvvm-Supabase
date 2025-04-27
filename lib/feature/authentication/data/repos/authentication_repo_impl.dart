import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel/core/error/failure.dart';
import 'package:travel/core/utils/function/checkinternet.dart';
import 'package:travel/feature/authentication/data/model/user.dart' as app_user;
import 'package:travel/feature/authentication/data/repos/authentication_repo.dart';

class AuthenticationRepoImpl implements AuthenticationRepo {
  Dio dio = Dio();
  final supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, void>> signIn(String email, String password) async {
    if (await checkInternet()) {
      try {
        // Example POST request if you were using your API
        final response = await supabase.auth
            .signInWithPassword(password: password, email: email);

        // For now just return Right(null);
        return Right(null);
      } catch (e) {
        return Left(ServeurFailure(errorsMessage: e.toString()));
      }
    } else {
      return Left(ServeurFailure(errorsMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, void>> signUp(
      String email, String password, String username, String phone) async {
    if (await checkInternet()) {
      try {
        final response = await supabase.auth.signUp(
          email: email,
          password: password,
        );
        if (response.user == null) {
          return Left(ServeurFailure(
              errorsMessage: "Sign up failed. No user created."));
        }
        String uid = supabase.auth.currentUser!.id;

        await supabase.from('users').insert({
          'id': uid,
          'email': email,
          'username': username,
          'phone': phone,
          'password': password
        });

        return Right(null);
      } catch (e) {
        return Left(ServeurFailure(errorsMessage: e.toString()));
      }
    } else {
      return Left(ServeurFailure(errorsMessage: "No Internet Connection"));
    }
  }
}
