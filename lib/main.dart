import 'package:flutter/material.dart';
import 'package:tvv_test/component/myColors.dart';
import 'package:tvv_test/view/myRegistrationPage.dart';
import 'package:tvv_test/view/registrationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thaivivat ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryGreen),
        useMaterial3: false,
      ),
      initialRoute: '/registration',
      routes: {
        RegistrationPage.routeName:(context) => RegistrationPage(),
        MyRegistrationPage.routeName:(context) => MyRegistrationPage(),
      },
    );
  }
}
