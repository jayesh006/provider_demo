

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/loginpage/viewmodels/login_viewmodel.dart';
import 'package:provider_demo/loginpage/widget/textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewmodel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            "Login",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 20),
                CustomTextField(
                  sufixIconPress: () {},
                  hintText: "Enter Email",
                  text: "Email",
                  showSufixIcon: false,
                  onChange: (value) {
                    loginViewModel.setEmail(value);
                  },
                ),
                SizedBox(height: 20),

                CustomTextField(
                  onChange: (value) {
                    loginViewModel.setPassword(value);
                  },
                  hintText: "Enter Password",
                  text: "Password",
                  sufixIconPress: () async{
                    loginViewModel.togglePasswordIcon();
                    await Future.delayed(Duration(seconds: 1));
                    loginViewModel.setShowPasswordFalse();
                  },
                  obscureText: !loginViewModel.showPassword,
                  showSufixIcon: true,
                  sufixIcon: loginViewModel.showPassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                SizedBox(height: 20,),
                if(loginViewModel.isError != null)
                  Text(loginViewModel.isError),
                SizedBox(height: 20),
                (loginViewModel.isLoading == true)
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          print(
                            "Submit : ${loginViewModel.email} ${loginViewModel.password}",
                          );

                          bool result = await loginViewModel.login();

                          if (result) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Login Success")),
                            );
                          }
                        },
                        child: Text("Submit"),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
