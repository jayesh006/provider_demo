import 'package:flutter/material.dart';

class LoginViewmodel extends ChangeNotifier {
  // Showhide password
  bool _showPassword = false;
  bool get showPassword => _showPassword;
  void setShowPasswordFalse(){
    _showPassword = false;
    notifyListeners();
  }

  void togglePasswordIcon() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  bool _isLoding = false;
  bool get isLoading => _isLoding;
  String _isError = "";
  String get isError => _isError;

  String _email = "";
  String _password = "";

  String get email => _email;
  String get password => _password;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future login() async {
    _isLoding = true;
    _isError = "";
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    if (_email == "test@gmail.com" && _password == "1234") {
      _isLoding = false;
      notifyListeners();
      return true;
    } else {
      _isLoding = false;
      _isError = "Invalid Email and Password";
      notifyListeners();
      return false;
    }
  }
}
