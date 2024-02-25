import 'package:adventurize/presentation/widgets/text/subtitle_text.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key})
      : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  bool sent = false;

  void _handleSubmitted(String email) async {
    _emailController.clear();
    await sendEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar senha"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
              child: SubtitleText(
                title:
                    "Digite o seu email para receber uma nova senha",
              ),
            ),
            TextField(
              controller: _emailController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      _handleSubmitted(_emailController.text);
                    },
                    icon: const Icon(Icons.send)),
                fillColor: Colors.white,
                filled: Theme.of(context).brightness == Brightness.light,
                hintText: "E-mail",
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendEmail(String email) async {

  }
}
