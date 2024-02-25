import 'package:adventurize/core/error/failure.dart';
import 'package:adventurize/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository{
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> createAccount(String email, String password);
  Either<Failure, bool> logout();
  Either<Failure, bool> isLogged();
  Either<Failure, String> getToken();
}