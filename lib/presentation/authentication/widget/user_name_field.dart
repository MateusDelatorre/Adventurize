import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    super.key,
    this.controller,
    this.errorText,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? errorText;
  final void Function(String)? onChanged;

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
            hintText: "Usuário",
            errorText: errorText,
            prefixIcon: Icon(
                color: Theme.of(context).brightness == Brightness.light
                    ? const Color(0xffD108DC)
                    : Colors.white,
                Icons.person),
          ),
          cursorColor: Theme.of(context).brightness == Brightness.light
              ? null
              : Colors.white,
        ));
  }
}
