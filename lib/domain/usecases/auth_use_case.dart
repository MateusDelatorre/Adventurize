import 'package:adventurize/core/error/failure.dart';
import 'package:adventurize/domain/entities/user.dart';
import 'package:adventurize/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthUseCase{
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, User>> createAccount(String email, String password) async {
    return _authRepository.createAccount(email, password);
  }

  Future<Either<Failure, User>> login(String email, String password) async {
    return await _authRepository.login(email, password);
  }

  Future<Either<Failure, bool>> logout() async {
    return _authRepository.logout();
  }

  Future<Either<Failure, bool>> isLogged() async {
    return _authRepository.isLogged();
  }

  Future<Either<Failure, String>> getToken() async {
    return _authRepository.getToken();
  }
}