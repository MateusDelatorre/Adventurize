import 'package:adventurize/core/form_validation/form_validator.dart';
import 'package:adventurize/data/repository/remote/auth_repository_concrete.dart';
import 'package:adventurize/domain/usecases/auth_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc() : super(const CreateAccountState()) {
      on<EmailChangedEvent>(_onEmailChanged);
      on<PasswordChangedEvent>(_onPasswordChanged);
      on<SubmittedEvent>(_onSubmitted);
  }

  final AuthUseCase _authUseCase = AuthUseCase(AuthRepositoryConcrete());

  void _onEmailChanged(EmailChangedEvent event, Emitter<CreateAccountState> emit) {
    final email = event.email;
    emit(
      state.copyWith(
        email: email,
        isValid: FormValidator.validate(email: email, password: ''),
      ),
    );
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<CreateAccountState> emit) {
    emit(state.copyWith(
        password: event.password,
        isValid: FormValidator.validate(email: state.email, password: event.password),
    ));
  }

  Future<void> _onSubmitted(SubmittedEvent event, Emitter<CreateAccountState> emit) async {
    emit(state.copyWith(connectionState: ConnectionState.waiting));
    try{
      var response = await _authUseCase.createAccount(state.email, state.password);
      if(response.isRight()) {
        emit(state.copyWith(connectionState: ConnectionState.done));
      }else if(response.isLeft()){

      }
    }catch (e){

    }
  }

}
