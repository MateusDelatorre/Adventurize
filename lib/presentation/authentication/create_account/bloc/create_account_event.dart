part of 'create_account_bloc.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();
}

class EmailChangedEvent extends CreateAccountEvent {
  const EmailChangedEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChangedEvent extends CreateAccountEvent {
  const PasswordChangedEvent(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SubmittedEvent extends CreateAccountEvent {
  const SubmittedEvent();

  @override
  List<Object?> get props => [];
}
