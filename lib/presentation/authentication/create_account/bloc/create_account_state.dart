part of 'create_account_bloc.dart';

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.connectionState = ConnectionState.none,
    this.email = '',
    this.isValid = false,
    this.password = '',
  });

  final String email;
  final String password;
  final bool isValid;
  final ConnectionState connectionState;

  CreateAccountState copyWith({
    ConnectionState? connectionState,
    String? email,
    String? password,
    bool? isValid,
  }) {
    return CreateAccountState(
      connectionState: connectionState ?? this.connectionState,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [connectionState, email, isValid, password];
}
