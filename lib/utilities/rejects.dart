class RejectsHandeler {
  RejectsHandeler();

  String emailValidation(String value) {
    Pattern pattern = r'(?=.*?[@])';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter your email';
    } else if (!regex.hasMatch(value)) {
      return 'email should have "@" character';
    } else if (value.contains(" ")) {
      return 'email should not contain any spaces';
    } else {
      return null;
    }
  }

  String passwordValidation(String value) {
    // Pattern pattern =
    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@\$&*~]).{8,}$';
    // RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 2) {
      return 'Password should have atleast 4 characters';
    } else if (value.contains(" ")) {
      return 'Password should not contain any spaces';
    } // else if (!regex.hasMatch(value)) {
    //return 'Invalid password';
    //}
    return null;
  }
}
