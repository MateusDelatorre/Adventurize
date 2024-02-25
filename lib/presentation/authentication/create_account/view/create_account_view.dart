import 'package:adventurize/presentation/authentication/create_account/bloc/create_account_bloc.dart';
import 'package:adventurize/presentation/authentication/widget/email_field.dart';
import 'package:adventurize/presentation/authentication/widget/password_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateAccountBloc, CreateAccountState>(
      listener: (context, state) {
        if (state.connectionState == ConnectionState.done) {
          context.go('/signUp');
        } else if (state.connectionState == ConnectionState.none) {
          ///TODO: Add error message
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _EmailInput(),
                const SizedBox(
                  height: 15,
                ),
                _PasswordInput(),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 2.5,
                  child: InkWell(
                    onTap: () {
                      context.go('/forgotPassword');
                    },
                    child: Text(
                      "Esqueceu sua senha?",
                      style: TextStyle(
                          color:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: _SignInButton(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                            color:
                            Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: "Já tem uma conta?",
                            ),
                            TextSpan(
                                text: "Login",
                                style: const TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.go('/signUp');
                                  })
                          ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      buildWhen: (previous, current) {
        if (previous.email != current.email ||
            previous.isValid != current.isValid) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return EmailField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<CreateAccountBloc>().add(EmailChangedEvent(email)),
          errorText: state.isValid ? null : '',
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      buildWhen: (previous, current) {
        if (previous.password != current.password ||
            previous.isValid != current.isValid) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return PassWordField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<CreateAccountBloc>().add(PasswordChangedEvent(password)),
          errorText: state.isValid ? null : '',
          onPressed: state.isValid
              ? () {
            context.read<CreateAccountBloc>().add(const SubmittedEvent());
          }
              : () => {},
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: state.isValid
                  ? () {
                context.read<CreateAccountBloc>().add(const SubmittedEvent());
              }
                  : () {
                ///TODO: Add error message
              },
              child: Text(
                "Criar Conta",
                style: const TextStyle(fontSize: 20),
              )
            ),
          ),
        );
      },
    );
  }
}
