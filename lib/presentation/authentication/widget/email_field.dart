import 'package:adventurize/core/form_validation/email_validator.dart';
import 'package:flutter/material.dart';

/// /// A text form field to ask user for his email address
class EmailField extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorText;

  final void Function(String)? onChanged;

  const EmailField({
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
          controller: controller,
          onChanged: onChanged,
          textInputAction: TextInputAction.next,
          validator: (email) {
            if (!EmailValidator.emailValidation(email ?? "")) {
              return "Email no]ão valido";
            }
            return null;
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 56, 182, 255), width: 2),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 56, 182, 255), width: 2)),
            errorText: errorText,
            hintText: "E-mail",
            prefixIcon: Icon(
                color: Theme.of(context).brightness == Brightness.light
                    ? const Color(0xffD108DC)
                    : Colors.white,
                Icons.email),
          ),
          cursorColor: Theme.of(context).brightness == Brightness.light
              ? null
              : Colors.white,
        ));
  }
}
