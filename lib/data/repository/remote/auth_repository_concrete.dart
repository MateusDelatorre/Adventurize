import 'package:adventurize/core/error/failure.dart';
import 'package:adventurize/data/model/UserModel.dart';
import 'package:adventurize/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryConcrete implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, UserModel>> createAccount(String email, String password) async {
    try {
      print("Create Account");
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return Right(UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          displayName: firebaseUser.displayName!,
        ));
      }
      return Left(Failure());
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return Left(Failure());
    } catch (e) {
      print(e.toString());
      return Left(Failure());
    }
  }

  @override
  Either<Failure, String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Either<Failure, bool> isLogged() {
    // TODO: implement isLogged
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Either<Failure, bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }


}