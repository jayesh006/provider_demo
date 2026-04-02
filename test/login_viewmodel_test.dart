import 'package:flutter_test/flutter_test.dart';
import 'package:provider_demo/loginpage/viewmodels/login_viewmodel.dart';

void main() {
  group('LoginViewmodel Tests', () {
    late LoginViewmodel loginViewmodel;

    setUp(() {
      loginViewmodel = LoginViewmodel();
    });

    test('Initial values', () {
      expect(loginViewmodel.showPassword, false);
      expect(loginViewmodel.isLoading, false);
      expect(loginViewmodel.isError, "");
      expect(loginViewmodel.email, "");
      expect(loginViewmodel.password, "");
    });

    test('Toggle password icon', () {
      loginViewmodel.togglePasswordIcon();
      expect(loginViewmodel.showPassword, true);

      loginViewmodel.togglePasswordIcon();
      expect(loginViewmodel.showPassword, false);
    });

    test('Set showPassword false', () {
      loginViewmodel.togglePasswordIcon(); // true
      loginViewmodel.setShowPasswordFalse();
      expect(loginViewmodel.showPassword, false);
    });

    test('Set email and password', () {
      loginViewmodel.setEmail("test@gmail.com");
      loginViewmodel.setPassword("1234");

      expect(loginViewmodel.email, "test@gmail.com");
      expect(loginViewmodel.password, "1234");
    });

    test('Login success', () async {
      loginViewmodel.setEmail("test@gmail.com");
      loginViewmodel.setPassword("1234");

      final result = await loginViewmodel.login();
      expect(result, true);
      expect(loginViewmodel.isLoading, false);
      expect(loginViewmodel.isError, "");
    });

    test('Login failure', () async {
      loginViewmodel.setEmail("wrong@gmail.com");
      loginViewmodel.setPassword("0000");

      final result = await loginViewmodel.login();
      expect(result, false);
      expect(loginViewmodel.isLoading, false);
      expect(loginViewmodel.isError, "Invalid Email and Password");
    });
  });
}