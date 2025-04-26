import 'package:meta/meta.dart';
import 'package:travel/feature/authentication/data/model/user.dart';
import 'package:travel/feature/authentication/data/repos/authentication_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepo authenticationRepo;
  AuthenticationCubit(this.authenticationRepo) : super(AuthenticationInitial());
  Future<void> signUp(String email, String password,String username,String phone) async {
    emit(AuthenticationLoading());
    try {
      final result = await authenticationRepo.signUp(email, password,username,phone);
      result.fold(
        (failure) =>
            emit(AuthenticationFailure(errorMessage: failure.errorMessage)),
        (success) => emit(AuthenticationSuccess()),
      );
    } catch (e) {
      emit(AuthenticationFailure(errorMessage: "An error occurred"));
    }
  }

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final result = await authenticationRepo.signIn(email, password);
      result.fold(
        (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
        (token) => emit(LoginSuccess()),
      );
    } catch (e) {
      emit(AuthenticationFailure(errorMessage: "An error occurred"));
    }
  }


}
