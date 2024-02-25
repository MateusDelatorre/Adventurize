import 'package:adventurize/core/form_validation/email_validator.dart';
import 'package:adventurize/core/form_validation/password_validator.dart';

class FormValidator {
  static bool validate({required String email, required String password}) {
    if (EmailValidator.emailValidation(email)) {
      return PasswordValidator.passwordValidation(password);
    } else {
      return false;
    }
  }
}