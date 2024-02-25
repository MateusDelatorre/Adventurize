class PasswordValidator {
  static bool passwordValidation(String password) {
    if (RegExp(r"^.{8,}$").hasMatch(password)) {
      return true;
    }
    return false;
  }
}