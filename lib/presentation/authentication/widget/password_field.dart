import 'package:adventurize/core/form_validation/password_validator.dart';
import 'package:flutter/material.dart';

/// A text form field to ask user for his password
class PassWordField extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorText;
  final void Function(String)? onChanged;
  final void Function()? onPressed;

  const PassWordField({
    super.key,
    this.controller,
    this.errorText,
    this.onChanged,
    this.onPressed,
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
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) {
              onPressed!();
            },
            validator: (password) {
              if (!PasswordValidator.passwordValidation(password ?? "")) {
                return "Sua senha deve ter ao menos 8 caracteres.";
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
              hintText: "Senha",
              prefixIcon: Icon(
                  color: Theme.of(context).brightness == Brightness.light
                      ? const Color(0xffD108DC)
                      : Colors.white,
                  Icons.lock),
            )
            //prefixIconColor: Colors.white),
            ));
  }
}
