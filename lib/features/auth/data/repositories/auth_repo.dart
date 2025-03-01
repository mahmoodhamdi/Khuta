import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract final class AuthRepo {
  //sign up
  Future<Either<String, User>> signUpWithEmailAndPassword(
    String email,
    String password,
  );

  //login
  Future<Either<String, User>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  //sign in with google
  Future<Either<String, User>> signInWithGoogle();
  //reset password
  Future<Either<String, void>> resetPassword(String email);

  //sign out
  Future<Either<String, void>> signOut();

  //get current user
  Future<Either<String, User?>> getCurrentUser();
}

final class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<String, User?>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<String, User>> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<String, User>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<String, User>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}
