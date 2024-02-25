import 'package:adventurize/presentation/authentication/create_account/bloc/create_account_bloc.dart';
import 'package:adventurize/presentation/authentication/create_account/view/create_account_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CreateAccountBloc(),
        child: const CreateAccountView(),
      ),
    );
  }
}