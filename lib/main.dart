import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider_demo/counter/view/counter_view.dart';
import 'package:provider_demo/counter/viewmodels/counter_viewmodel.dart';
import 'package:provider_demo/loginpage/view/login_view.dart';
import 'package:provider_demo/loginpage/viewmodels/login_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterViewmodel()),
        ChangeNotifierProvider(create: (_) => LoginViewmodel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const LoginView(),
    );
  }
}
