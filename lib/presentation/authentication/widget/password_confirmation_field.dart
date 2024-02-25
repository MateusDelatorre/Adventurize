import 'package:adventurize/core/form_validation/password_validator.dart';
import 'package:flutter/material.dart';

/// A text form field to ask user for his password
class PassWordFieldConfirmation extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorText;
  final void Function(String)? onChanged;

  const PassWordFieldConfirmation({
    super.key,
    this.controller,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: TextFormField(
          obscureText: true,
          controller: controller,
          onChanged: onChanged,
          textInputAction: TextInputAction.next,
          validator: (password) {
            if (!PasswordValidator.passwordValidation(password ?? "")) {
              return "Sua senha deve ter ao menos 8 caracteres";
            }
            return null;
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 56, 182, 255), width: 2)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 56, 182, 255), width: 2)),
              errorText: errorText,
              hintText: "Confirmar senha",
              prefixIcon: Icon(
                  color: Theme.of(context).brightness == Brightness.light
                      ? null
                      : Colors.white,
                  Icons.lock),
              prefixIconColor: Colors.white),
        ));
  }
}
